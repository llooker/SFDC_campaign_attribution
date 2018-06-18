view: account {
  sql_table_name: public.account ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_status_c {
    type: string
    sql: ${TABLE}.account_status_c ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: campaign2_c {
    type: string
    sql: ${TABLE}.campaign2_c ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
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

  dimension_group: customer_end_date_c {
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
    sql: ${TABLE}.customer_end_date_c ;;
  }

  dimension: customer_reference_c {
    type: yesno
    sql: ${TABLE}.customer_reference_c ;;
  }

  dimension_group: customer_start_date_c {
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
    sql: ${TABLE}.customer_start_date_c ;;
  }

  dimension: engagement_stage_c {
    type: string
    sql: ${TABLE}.engagement_stage_c ;;
  }

  dimension: is_partner {
    type: yesno
    sql: ${TABLE}.is_partner ;;
  }

  dimension: market_segment_c {
    type: string
    sql: ${TABLE}.market_segment_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: vertical_c {
    type: string
    sql: ${TABLE}.vertical_c ;;
  }

  dimension: zendesk_organization {
    type: string
    sql: ${TABLE}.zendesk_organization ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, contact.count, lead.count, opportunity.count]
  }
}
