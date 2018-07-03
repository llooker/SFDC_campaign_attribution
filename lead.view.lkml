view: lead {
  sql_table_name: public.lead ;;
  view_label: "C: Person"

  dimension: id {
    label: "Lead ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: string
    hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: analyst_name_c {
    group_label: "Lead Specific Attributes"
    type: string
    sql: ${TABLE}.analyst_name_c ;;
  }

  dimension: annual_revenue {
    group_label: "Lead Specific Attributes"
    type: number
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: city {
    group_label: "Lead Specific Attributes"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company {
    group_label: "Lead Specific Attributes"
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: converted_contact_id {
    group_label: "Lead Specific Attributes"
    type: string
    sql: ${TABLE}.converted_contact_id ;;
  }

  dimension: converted_opportunity_id {
    group_label: "Lead Specific Attributes"
    type: string
    sql: ${TABLE}.converted_opportunity_id ;;
  }

  dimension: country {
    group_label: "Lead Specific Attributes"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    hidden: yes
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

  dimension: current_customer_c {
    group_label: "Lead Specific Attributes"
    type: yesno
    sql: ${TABLE}.current_customer_c ;;
  }

  dimension: department_c {
    hidden: yes
    type: string
    sql: ${TABLE}.department_c ;;
  }

  dimension: email {
    hidden: yes
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: grouping_c {
    hidden: yes
    type: string
    sql: ${TABLE}.grouping_c ;;
  }

  dimension: intro_meeting_c {
    hidden: yes
    type: yesno
    sql: ${TABLE}.intro_meeting_c ;;
  }

  dimension: is_converted {
    group_label: "Lead Specific Attributes"
    type: yesno
    sql: ${TABLE}.is_converted ;;
  }

  dimension: job_function_c {
    hidden: yes
    type: string
    sql: ${TABLE}.job_function_c ;;
  }

  dimension: lead_processing_status_c {
    group_label: "Lead Specific Attributes"
    type: string
    sql: ${TABLE}.lead_processing_status_c ;;
  }

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_employees {
    group_label: "Lead Specific Attributes"
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: state {
    group_label: "Lead Specific Attributes"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    group_label: "Lead Specific Attributes"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: territory_c {
    hidden: yes
    type: string
    sql: ${TABLE}.territory_c ;;
  }

  dimension: title {
    hidden: yes
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: year_founded_c {
    group_label: "Lead Specific Attributes"
    type: string
    sql: ${TABLE}.year_founded_c ;;
  }

  dimension: zendesk_organization {
    hidden: yes
    type: string
    sql: ${TABLE}.zendesk_organization ;;
  }

  dimension: segment {
    label: "Employee Segment"
    type: string
    group_label: "Lead Specific Attributes"
    sql:
        case
          when ${number_of_employees} between 0 and 50 THEN '1. SMB'
          when ${number_of_employees} between 51 and 500 THEN '2. MM'
          when ${number_of_employees} between 501 and 3000 THEN '3. COM'
          when ${number_of_employees} > 3000 THEN '4. ENT'
          else '1. SMB'
          end ;;
    description: "Buckets leads into corporate employee segments: SMB, MM, COM, ENT."
  }

  measure: lead_count {
    type: count
    drill_fields: [id, name, account.name, account.id]
  }
}
