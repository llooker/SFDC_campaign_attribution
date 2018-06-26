view: opportunity {
  sql_table_name: public.opportunity ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: acv {
    type: number
    sql: ${TABLE}.acv ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: churn_status_c {
    type: string
    sql: ${TABLE}.churn_status_c ;;
  }

  dimension_group: closed {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.closed_date ;;
  }

  dimension: contract_length_c {
    type: number
    sql: ${TABLE}.contract_length_c ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: is_cancelled_c {
    type: yesno
    sql: ${TABLE}.is_cancelled_c ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_won {
    type: yesno
    sql: ${TABLE}.is_won ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: mrr {
    type: number
    sql: ${TABLE}.mrr ;;
  }

  dimension: nrr {
    type: number
    sql: ${TABLE}.nrr ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
  }

  dimension: renewal_number_c {
    type: number
    sql: ${TABLE}.renewal_number_c ;;
  }

  dimension: renewal_opportunity_id {
    type: string
    sql: ${TABLE}.renewal_opportunity_id ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension: total_contract_value_c {
    type: number
    sql: ${TABLE}.total_contract_value_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: current_quarter {
#     hidden: yes
    sql: EXTRACT(YEAR FROM CURRENT_DATE) || ' - Q' || EXTRACT(QUARTER FROM CURRENT_DATE) ;;
  }

  dimension: days_left_in_quarter {
    type: number
    sql: 91 - (DATEDIFF(
        'day',
        CAST(CONCAT((TO_CHAR(CAST(DATE_TRUNC('quarter', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CURRENT_DATE)) AS DATE), 'YYYY-MM')), '-01') as date),
        CURRENT_DATE)) - 1
       ;;
  }

  dimension: day_of_current_quarter {
    type: number
    sql: (DATEDIFF(
       'day',
       CAST(CONCAT((TO_CHAR(CAST(DATE_TRUNC('quarter', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', CURRENT_DATE)) AS DATE), 'YYYY-MM')), '-01') as date),
       CURRENT_DATE)) + 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [id, stage_name, campaign.id, account.name, account.id]
  }

  dimension: lead_to_opp_weeks{
    type: number
    sql: datediff(week, ${created_date}, ${lead.created_date}) ;;
  }

  dimension: lead_to_opp_in_4wks {
    type: yesno
    sql: (${lead_to_opp_weeks} <= 4) ;;
  }

  measure: num_opps_in_4wks {
    type: count
    filters: {
      field: lead_to_opp_in_4wks
      value: "yes"
    }
  }

  measure: lead_to_opp_4wks_conversion{
    type: number
    sql: ${num_opps_in_4wks}*1.00/nullif(${lead.lead_count},0) ;;
    value_format_name: percent_2
  }
}
