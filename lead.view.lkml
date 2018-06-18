view: lead {
  sql_table_name: public.lead ;;

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

  dimension: analyst_name_c {
    type: string
    sql: ${TABLE}.analyst_name_c ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: converted_contact_id {
    type: string
    sql: ${TABLE}.converted_contact_id ;;
  }

  dimension: converted_opportunity_id {
    type: string
    sql: ${TABLE}.converted_opportunity_id ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: current_customer_c {
    type: yesno
    sql: ${TABLE}.current_customer_c ;;
  }

  dimension: department_c {
    type: string
    sql: ${TABLE}.department_c ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: grouping_c {
    type: string
    sql: ${TABLE}.grouping_c ;;
  }

  dimension: intro_meeting_c {
    type: yesno
    sql: ${TABLE}.intro_meeting_c ;;
  }

  dimension: is_converted {
    type: yesno
    sql: ${TABLE}.is_converted ;;
  }

  dimension: job_function_c {
    type: string
    sql: ${TABLE}.job_function_c ;;
  }

  dimension: lead_processing_status_c {
    type: string
    sql: ${TABLE}.lead_processing_status_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: territory_c {
    type: string
    sql: ${TABLE}.territory_c ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: year_founded_c {
    type: string
    sql: ${TABLE}.year_founded_c ;;
  }

  dimension: zendesk_organization {
    type: string
    sql: ${TABLE}.zendesk_organization ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, account.name, account.id]
  }
}
