view: campaign_attribution {
  derived_table: {
    sql:
       SELECT
      *,
      case
        -- first we check to see if a member is the FT after an opp close date where that person doesn't have another opp.
        -- replace partition with who_id if exists
         when
            first_value(member_id) over
                    (partition by coalesce(opportunity_id, coalesce(contact_id, lead_id)) order by
                      case
                        when after_closed_won_date then 0
                        else 1
                      end,
                    member_created_date asc rows between unbounded preceding and unbounded following) = member_id
             and after_closed_won_date
             and opportunity_future_create_date is null
          then 1
          -- then we check to see if a member is the FT on an opp and then a person (if there is no opp). That's what the "paritioner" does.
        when
          first_value(member_id) over
                  (partition by coalesce(opportunity_id, coalesce(contact_id, lead_id)) order by member_created_date asc rows between unbounded preceding and unbounded following) = member_id
          and not after_opportunity_create_date
        then 1
        else 0
      end as first_touch_attribution_weight,
      -- for the purposes of demo and creating a more standardized definition we're going to calculate LT MQL attribution as the last touch before an opp created date
       case
         when
           last_value(
             case
               when datediff(day,member_created_date,opportunity_created_date) >= 0
               then member_id
               else null
             end
             ) ignore nulls over
               (partition by coalesce(opportunity_id, coalesce(contact_id, lead_id)) order by member_created_date rows between unbounded preceding and unbounded following) = member_id
           and not after_opportunity_create_date
         then 1
         else 0
       end as last_touch_mql_attribution_weight,
      -- Multi-touch attribution only makes sense in the context of an opportunity and specifically, fractional opps, pipeline and closed deals. We'll just use
      -- linear for now because realistically we can't be much more precise than that at this time and the reduces complexity is beneficial.
      coalesce(
        case
          when opportunity_id is not null
            and not after_closed_won_date
          then 1
          else 0
        end / cast(nullif(count(
        case
          when not after_closed_won_date
          then member_id
          else null
        end
        ) over (partition by opportunity_id),0) as decimal(38,18)),0
        ) as linear_attribution_weight,
      row_number() over () as pk
    FROM
    (
      SELECT
        cm.created_at as member_created_date,
        cm.contact_id as contact_id,
        cm.lead_id as lead_id,
        cm.id as member_id,
        cm.campaign_id as campaign_id,
        cr.opportunity_id,
        cr.opportunity_created_date,
        cr.opportunity_closed_date,
        cr.opportunity_prev_close_date,
        cr.opportunity_future_create_date,
        case
          when datediff(day,cm.created_at,cr.opportunity_closed_date) < 0 and  cr.stage_name = 'Closed Won' then true
          else false
        end as after_closed_won_date,
        case
          when datediff(day,cm.created_at,cr.opportunity_created_date) < 0 then true
          else false
        end as after_opportunity_create_date,
         -- flag "amendment touches" which can be any touch after a closed won deal or one that has a prev_close_date
        case
          when (datediff(day,cm.created_at,cr.opportunity_closed_date) < 0 and cr.stage_name = 'Closed Won') or cr.opportunity_prev_close_date is not null
          then true
          else false
        end as amendment_touch
      FROM
       campaign_member cm
      LEFT OUTER JOIN
       ( SELECT
           ocr.contact_id,
           o.id as opportunity_id,
           o.created_at as opportunity_created_date,
           o.closed_date as opportunity_closed_date,
           o.stage_name,
           -- previous close dates of won deals only
           lag(case when o.stage_name = 'Closed Won' then o.closed_date else null end,1) ignore nulls over (partition by ocr.contact_id order by o.closed_date asc) as opportunity_prev_close_date,
            -- find out if this person has a future opp
          lag(o.created_at,1) ignore nulls over (partition by ocr.contact_id order by o.closed_date desc) as opportunity_future_create_date
         FROM
          opportunity o
         LEFT OUTER JOIN
          opportunity_contact_role ocr
         ON o.id = ocr.opportunity_id
         -- filter out existing business
         WHERE o."type" not in ('Renewal','Existing Business')
        ) cr
      ON cm.contact_id = cr.contact_id
      -- filter out (member,opp) pairs where there is a previous close date and the cm date is before it (these members will get credit for the previous one).
      WHERE (cm.created_at > cr.opportunity_prev_close_date or cr.opportunity_prev_close_date is null)
    );;
  }


################################################
# Raw table fields
################################################
  dimension: pk {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.pk ;;
  }

  dimension: contact_id {
    hidden: yes
    type: string
    sql: ${TABLE}.contact_id ;;
  }

  dimension: lead_id {
    hidden: yes
    type: string
    sql: ${TABLE}.lead_id ;;
  }

  dimension: member_id {
    hidden: yes
    type: string
    sql: ${TABLE}.member_id ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: string
    sql: ${TABLE}.campaign_id ;;
#     link: {
#       label: "Campaign Record"
#       url: "https://instance.my.salesforce.com/{{ campaign_id }}"
#       icon_url: "https://instance.my.salesforce.com/favicon.ico"
#     }
  }

  dimension: opportunity_id {
    hidden: yes
    type: string
    sql: ${TABLE}.opportunity_id ;;
#     link: {
#       label: "Opportunity Record"
#       url: "https://instance.my.salesforce.com/{{ opportunity_id }}"
#       icon_url: "https://instance.my.salesforce.com/favicon.ico"
#     }
  }

  dimension: after_closed_won_date {
    type: yesno
    sql: ${TABLE}.after_closed_won_date ;;
    hidden: yes
  }

  dimension: after_opportunity_create_date {
    type: yesno
    sql: ${TABLE}.after_opportunity_create_date ;;
    hidden: yes
  }

  dimension: amendment_touch {
    view_label: "A: Campaign"
    type: yesno
    sql: ${TABLE}.amendment_touch ;;
  }

  dimension: first_touch_attribution_weight {
    type: number
    sql: ${TABLE}.first_touch_attribution_weight ;;
    hidden: yes
  }

  dimension: linear_attribution_weight {
    type: number
    sql: ${TABLE}.linear_attribution_weight ;;
    hidden: yes
  }
  dimension: last_touch_mql_attribution_weight {
    type: number
    sql: ${TABLE}.last_touch_mql_attribution_weight ;;
    hidden: yes
  }

  dimension: is_pipeline{
    hidden: yes
    type: yesno
    sql:
      (${opportunity.stage_name} not in ('Closed Won', 'Closed Lost'))
    ;;
  }


################################################
# Date fields
################################################

  dimension_group: member_created {
    view_label: "A: Campaign"
    type: time
    sql: ${TABLE}.member_created_date ;;
  }

  dimension: member_created_day_of_quarter{
  view_label: "A: Campaign"
  group_label: "Member Created Date"
  type: number
  sql:  DATEDIFF(day, DATE_TRUNC('quarter',  ${member_created_raw} ), ${member_created_raw}) + 1;;
}

  dimension_group: opportunity_created {
    hidden: yes
    type: time
    sql: ${TABLE}.opportunity_created_date ;;
  }

  dimension: opportunity_closed_date {
    hidden: yes
    type: date
    sql: ${TABLE}.opportunity_closed_date ;;
  }

  dimension: opportunity_prev_close {
    view_label: "D: Opportunity"
    type: date
    sql: ${TABLE}.opportunity_prev_close_date ;;
  }

  dimension_group: opportunity_future_create {
    type: time
    view_label: "D: Opportunity"
    sql: ${TABLE}.opportunity_future_create_date ;;
  }



# Funnel Metrics

################################################
# FT metrics
################################################


  measure: ft_all_leads {
    label: "01. First Touches (FTs)"
    view_label: "B: Funnel Metrics"
    group_label: "First-Touch"
    type: sum
    sql: ${first_touch_attribution_weight} ;;
    description: "Counts first touches for people. SFDC Contacts and Leads."
    drill_fields: [Person*]
  }


  measure: ft_campaign_opportunity_count {
    label: "02. FT Opportunities"
    view_label: "B: Funnel Metrics"
    group_label: "First-Touch"
    hidden: no
    type: count_distinct
    sql: ${opportunity_id} ;;
    filters:{
      field: first_touch_attribution_weight
      value: "1"
    }
    description: "Counts opportunities for first touches."
    drill_fields: [Opportunity*]
  }

  measure: ft_campaign_opportunity_pipeline {
    #I have doubts on whether we want sum_distinct here
    label: "FT Opportunity Pipeline"
    view_label: "B: Funnel Metrics"
    group_label: "First-Touch"
    hidden: no
    type: sum_distinct
    sql: ${opportunity.acv} ;;
    filters:{
      field: first_touch_attribution_weight
      value: "1"
    }
    filters:{
      field: is_pipeline
      value: "yes"
    }
    value_format: "$#,##0"
    description: "Sums opportunity ACV pipeline for first touches."
    drill_fields: [Opportunity*]
  }

  measure: ft_campaign_closed_won_count {
    label: "03. FT Won Opportunities"
    view_label: "B: Funnel Metrics"
    group_label: "First-Touch"
    hidden: no
    type: count_distinct
    sql: ${opportunity_id} ;;
    filters:{
      field: first_touch_attribution_weight
      value: "1"
    }
    filters:{
      field: opportunity.stage_name
      value: "Closed Won"
    }
    filters:{
      field: after_closed_won_date
      value: "no"
    }
    description: "Counts won opportunities for first touches."
    drill_fields: [Opportunity*]
  }

  measure: ft_campaign_closed_won_total_acv {
    label: "FT Won ACV"
    view_label: "B: Funnel Metrics"
    group_label: "First-Touch"
    hidden: no
    type: sum
    sql: ${opportunity.acv} ;;
    filters:{
      field: first_touch_attribution_weight
      value: "1"
    }
    filters:{
      field: opportunity.stage_name
      value: "Closed Won"
    }
    filters:{
      field: after_closed_won_date
      value: "no"
    }
    value_format: "$#,##0"
    description: "Sums first year ACV for first touches."
    drill_fields: [Opportunity*]
  }

  measure: ft_to_opp_won_conversion_rate {
    type: number
    description: "Calculates the conversion rate of members to won opportunities"
    view_label: "B: Funnel Metrics"
    group_label: "First-Touch"
    sql: (${ft_campaign_closed_won_count} * 1.00)/nullif(${ft_all_leads},0) ;;
    value_format_name: percent_2
  }
  measure: ft_lead_to_opp_create_conversion_rate {
    type: number
    description: "Calculates the conversion rate of members to opportunities"
    view_label: "B: Funnel Metrics"
    group_label: "First-Touch"
    sql: (${ft_campaign_opportunity_count} * 1.00)/nullif(${ft_all_leads},0) ;;
    value_format_name: percent_2
  }
################################################
# LT MQL Metrics
################################################

  measure: mql_touch_count {
    label: "01. MQL Touches"
    view_label: "B: Funnel Metrics"
    group_label: "MQL-Touch"
    type: sum
    sql: ${last_touch_mql_attribution_weight}
      ;;
    description: "Counts last touches prior to lead becoming an MQL or reaching stage"
    drill_fields: [Person*]

  }

  measure: mql_touch_opportunities{
    label: "02. MQL Opportunities"
    view_label: "B: Funnel Metrics"
    group_label: "MQL-Touch"
    type: count_distinct
    sql: ${opportunity_id} ;;
    filters: {
      field: last_touch_mql_attribution_weight
      value: "1"
    }
    description: "Counts opportunities associated with last touches prior to lead MQL-ing."
    drill_fields: [Opportunity*]
  }

  measure: mql_touch_won_opportunities{
    label: "03. MQL Won Opportunities"
    view_label: "B: Funnel Metrics"
    group_label: "MQL-Touch"
    type: count
    filters: {
      field: last_touch_mql_attribution_weight
      value: "1"
    }
    filters: {
      field: opportunity.stage_name
      value: "Closed Won"
    }
    description: "Counts won opportunities associated with last touches prior to lead MQL-ing."
    drill_fields: [Opportunity*]
  }

  measure: mql_touch_won_acv{
    label: "MQL Won ACV"
    view_label: "B: Funnel Metrics"
    group_label: "MQL-Touch"
    type: sum_distinct
    sql: ${opportunity.acv} ;;
    filters: {
      field: last_touch_mql_attribution_weight
      value: "1"
    }
    filters: {
      field: opportunity.stage_name
      value: "Closed Won"
    }
    description: "Counts won opportunities associated with last touches prior to lead MQL-ing."
    drill_fields: [Opportunity*]
  }

  measure: mql_to_opp_won_conversion_rate {
    type: number
    description: "Calculates the conversion rate of members to won opportunities"
    view_label: "B: Funnel Metrics"
    group_label: "MQL-Touch"
    sql: (${mql_touch_won_opportunities} * 1.00)/nullif(${mql_touch_count},0) ;;
    value_format_name: percent_2
  }


################################################
# Linear Attribution Metrics
################################################

  measure: multi_touch_opportunities {
    label: "MT Opportunities"
    view_label: "B: Funnel Metrics"
    group_label: "Multi-Touch"
    hidden: no
#     type: sum_distinct
    type: sum
    sql: ${linear_attribution_weight} ;;
    filters: {
      field: linear_attribution_weight
      value: ">0"
    }
    value_format: "0.#"
    description: "# of opportunities divided by # of influencing touches."
    drill_fields: [Opportunity*]
  }

  measure: multi_touch_opportunity_pipeline {
    label: "MT Opportunity Pipeline"
    view_label: "B: Funnel Metrics"
    group_label: "Multi-Touch"
    hidden: no
    type: sum_distinct
    sql: ${opportunity.acv}*${linear_attribution_weight} ;;
    filters:{
      field: linear_attribution_weight
      value: ">0"
    }
    filters:{
      field: opportunity.stage_name
      value: "-Closed Won,-Closed Lost"
    }
    value_format: "$#,##0"
    description: "All active pipeline times the linear attribution weight."
    drill_fields: [Opportunity*]
  }

  measure: mt_campaign_won_total_acv {
    label: "MT Won ACV"
    view_label: "B: Funnel Metrics"
    group_label: "Multi-Touch"
    hidden: no
    type: sum_distinct
    sql: ${opportunity.acv}*${linear_attribution_weight} ;;
    filters: {
      field: opportunity.stage_name
      value: "Closed Won"
    }
    filters: {
      field: linear_attribution_weight
      value: ">0"
    }
    value_format: "$#,##0"
    description: "1st Year ACV divided by the # of influencing touches"
    drill_fields: [Opportunity*]
  }

  measure: multi_touch_won_opportunities {
    label: "MT Won Opportunities"
    view_label: "B: Funnel Metrics"
    group_label: "Multi-Touch"
    hidden: no
#     type: sum_distinct
    type: sum
    sql: ${linear_attribution_weight} ;;
    filters: {
      field: linear_attribution_weight
      value: ">0"
    }
    filters: {
      field: opportunity.stage_name
      value: "Closed Won"
    }
    value_format: "0.#"
    description: "# of opportunities divided by # of influencing touches."
    drill_fields: [Opportunity*]
  }

################################################
# Dynamic Attribution Metrics
# Used for filtering on dashboards
################################################
  parameter: attribution_selector{
    view_label: "B: Funnel Metrics"
    type: unquoted
    allowed_value: {
      label: "First-Touch"
      value: "FT"
    }
    allowed_value: {
      label: "MQL-Touch"
      value: "MQL"
    }
    allowed_value: {
      label: "Linear Multi-Touch"
      value: "MT"
    }
  }

  #Note: these only make sense in the context of FT and MQL
  measure: dynamic_att_all_touches {
    type: number
    group_label: "Dynamic"
    view_label: "B: Funnel Metrics"
    label: "{% parameter attribution_selector %} 01. All Touches"
    sql: case when '{% parameter attribution_selector %}' = 'FT' then ${ft_all_leads}
        when '{% parameter attribution_selector %}' = 'MQL' then ${mql_touch_count}
        else null end;;
    drill_fields: [Person*]
  }

  measure: dynamic_att_opportunities {
    type: number
    group_label: "Dynamic"
    view_label: "B: Funnel Metrics"
    label: "{% parameter attribution_selector %} 02. Opportunities "
    sql: case when '{% parameter attribution_selector %}' = 'FT' then ${ft_campaign_opportunity_count}
        when '{% parameter attribution_selector %}' = 'MQL' then ${mql_touch_opportunities}
        when '{% parameter attribution_selector %}' = 'MT' then ${multi_touch_opportunities}
         else null end;;
    drill_fields: [Opportunity*]

  }

  measure: dynamic_att_won_opportunities {
    type: number
    group_label: "Dynamic"
    view_label: "B: Funnel Metrics"
    label: "{% parameter attribution_selector %} 03. Won Opportunities"
    sql: case when '{% parameter attribution_selector %}' = 'FT' then ${ft_campaign_closed_won_count}
        when '{% parameter attribution_selector %}' = 'MQL' then ${mql_touch_won_opportunities}
        when '{% parameter attribution_selector %}' = 'MT' then ${multi_touch_won_opportunities}
         else null end;;
    drill_fields: [Opportunity*]
  }

  measure: dynamic_att_won_acv {
    type: number
    group_label: "Dynamic"
    view_label: "B: Funnel Metrics"
    value_format_name: usd
    label: "{% parameter attribution_selector %} Won ACV"
    sql: case when '{% parameter attribution_selector %}' = 'FT' then ${ft_campaign_closed_won_total_acv}
        when '{% parameter attribution_selector %}' = 'MQL' then ${mql_touch_won_acv}
        when '{% parameter attribution_selector %}' = 'MT' then ${mt_campaign_won_total_acv}
         else null end;;
    drill_fields: [Opportunity*]

  }
  measure: dynamic_att_opp_pipeline {
    type: number
    group_label: "Dynamic"
    value_format_name: usd
    view_label: "B: Funnel Metrics"
    label: "{% parameter attribution_selector %} Opportunity Pipeline"
    sql: case when '{% parameter attribution_selector %}' = 'FT' then ${ft_campaign_opportunity_pipeline}
        when '{% parameter attribution_selector %}' = 'MT' then ${multi_touch_opportunity_pipeline}
         else null end;;
    drill_fields: [Opportunity*]

  }



  measure: dynamic_touch_to_won_conversion {
    type: number
    value_format_name: percent_2
    group_label: "Dynamic"
    view_label: "B: Funnel Metrics"
    label: "{% parameter attribution_selector %} Won Conversion Rate"
    sql:
        case when '{% parameter attribution_selector %}' = 'FT' then ${ft_to_opp_won_conversion_rate}
        when '{% parameter attribution_selector %}' = 'MQL' then ${mql_to_opp_won_conversion_rate}
         else null end;;
    drill_fields: [Opportunity*]

  }




################################################
# Count Measures
################################################

  measure: member_count {
    label: "Members"
    view_label: "B: Funnel Metrics"
    group_label: "Influence"
    type: count_distinct
    sql: ${TABLE}.member_id ;;
    description: "Counts all campaign members."
    drill_fields: [Member*]
  }

  measure: opp_count {
    label: "Opportunites"
    view_label: "B: Funnel Metrics"
    group_label: "Influence"
    type: count_distinct
    sql: ${opportunity_id} ;;
    description: "Sums all opportunities a campaign has influenced."
  }

################################################
# Cohorting Dimensions and Measures
################################################

  dimension: member_days_to_close {
    description: "Days between when a member was created and the opportunity was closed"
    hidden: yes
    type: number
    sql: datediff(days,  ${member_created_date}, ${opportunity_closed_date}) ;;
  }

  dimension: opportunity_delta {
    hidden: yes
    type: number
    sql: datediff(days, ${member_created_date}, ${opportunity_created_date}) ;;
  }

  dimension: lead_created_to_opp_created_cohort_by_week {
    label: "TO Delta (W)"
    view_label: "D: Opportunity"
    type: string
    sql: case
        when ${opportunity_delta} < 0
          OR ${opportunity_delta} is null
        then null
        when ${opportunity_delta} <= '6'
        then '1 week'
        when ${opportunity_delta} <= '13'
        then '2 weeks'
        when ${opportunity_delta} <= '20'
        then '3 weeks'
        when ${opportunity_delta} <= '27'
        then '4 weeks'
        when ${opportunity_delta} <= '34'
        then '5 weeks'
        when ${opportunity_delta} <= '41'
        then '6 weeks'
        when ${opportunity_delta} <= '48'
        then '7 weeks'
        when ${opportunity_delta} <= '55'
        then '8 weeks'
        else '9+ weeks'
      end
       ;;
    description: "This is the difference between the lead create date and opportunity creation date in (up to 27) weeks."
  }

  dimension: lead_created_to_opportunity_close_delta_quarters {
    label: "LC Delta in Quarters"
    group_label: "LC Delta"
    view_label: "D: Opportunity"
    type: number
    sql: case
        when ${opportunity.stage_name} = 'Closed Won'
        then datediff(Quarter,${lead.created_date},${opportunity_closed_date})
        else null
        end
       ;;
    description: "This is the difference between the lead created date and opportunity won date in quarters"
  }
  dimension: lead_created_to_opportunity_close_delta_month {
    group_label: "LC Delta"
    label: "LC Delta in Months"
    view_label: "D: Opportunity"
    type: number
    sql: case
        when ${opportunity.stage_name} = 'Closed Won'
        then datediff(month,${lead.created_date},${opportunity_closed_date})
        else null
        end
       ;;
    description: "This is the difference between the lead created date and opportunity won date in quarters"
  }
  dimension: lead_created_to_opportunity_close_delta_weeks {
    label: "LC Delta in Weeks"
    group_label: "LC Delta"
    view_label: "D: Opportunity"
    type: number
    sql: case
        when ${opportunity.stage_name} = 'Closed Won'
        then datediff(week,${lead.created_date},${opportunity_closed_date})
        else null
        end
       ;;
    description: "This is the difference between the lead created date and opportunity won date in quarters"
  }


  measure: avg_lead_created_close_velocity_quarters {
    label: "Average LC Velocity (Quarters)"
    view_label: "D: Opportunity"
    group_label: "Average LO Velocity"
    type: average
    sql: ${lead_created_to_opportunity_close_delta_quarters}
      ;;
    description: "This is the average difference between the lead create date and opportunity won date in quarters"
  }
  measure: avg_lead_created_close_velocity_month {
    label: "Average LC Velocity (Months)"
    group_label: "Average LC Velocity"
    view_label: "D: Opportunity"
    type: average
    sql: ${lead_created_to_opportunity_close_delta_month}
      ;;
    description: "This is the average difference between the lead create date and opportunity won date in months"
  }
  measure: avg_lead_created_close_velocity_weeks {
    label: "Average LC Velocity (Weeks)"
    group_label: "Average LC Velocity"
    view_label: "D: Opportunity"
    type: average
    sql: ${lead_created_to_opportunity_close_delta_weeks}
      ;;
    description: "This is the average difference between the lead create date and opportunity won date in weeks"
  }


  measure: avg_days_between_campaign_and_opportunity_created {
    label: "Average LO Velocity"
    view_label: "D: Opportunity"
    type: average
    sql: CASE
      WHEN ${opportunity_delta} < 0
        OR ${opportunity_delta} is null
      then null
      else ${opportunity_delta}
    end
    ;;
    value_format: "0 \" Days\""
    description: "Average # of Days between 1st Campaign Membership and Opportunity Created Date"

  }

  #Sets
  set: Person {
    fields: [lead.lead_created_date,lead.email,lead.company, lead.employee_range, opportunity.name,opportunity.acv,ft_all_leads]
  }

  set: Member {
    fields: [lead.lead_created_date,lead.status,lead.name, lead.grouping, lead.title,
      lead.email, lead.company, lead.employee_range]
  }

  set: Opportunity  {
    fields: [opportunity.opportunity_created_date,opportunity_id,opportunity.name,opportunity.type,
      opportunity.stage_name,ft_campaign_opportunity_pipeline,multi_touch_opportunity_pipeline,
      ft_campaign_closed_won_total_acv,mt_campaign_won_total_acv]
  }

  }
