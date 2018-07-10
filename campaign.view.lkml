view: campaign {
  sql_table_name: public.campaign ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: ad_type_c {
    type: string
    sql: ${TABLE}.ad_type_c ;;
  }

  dimension: allocation_c {
    type: string
    sql: ${TABLE}.allocation_c ;;
  }

  dimension: conversion_point_c {
    type: string
    sql: ${TABLE}.conversion_point_c ;;
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

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: grouping_c {
    type: string
    sql: ${TABLE}.grouping_c ;;
  }

  dimension: initiative_type_c {
    type: string
    sql: ${TABLE}.initiative_type_c ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: number_of_contacts {
    type: number
    sql: ${TABLE}.number_of_contacts ;;
  }

  dimension: number_of_leads {
    type: number
    sql: ${TABLE}.number_of_leads ;;
  }

  dimension: number_of_opportunities {
    type: number
    sql: ${TABLE}.number_of_opportunities ;;
  }

  dimension: number_of_responses {
    type: number
    sql: ${TABLE}.number_of_responses ;;
  }

  dimension: number_of_won_opportunities {
    type: number
    sql: ${TABLE}.number_of_won_opportunities ;;
  }

  dimension: origin_c {
    type: string
    sql: ${TABLE}.origin_c ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }


  # Used for comparing one campaign to the rest of the population
  filter: campaign_comparator {
    suggest_dimension: id
  }

  dimension: campaign_selected {
    type: string
    suggest_dimension: id
    sql: case when {% condition campaign_comparator %} ${id} {% endcondition %} then ${id} else 'Other Campaigns' end;;
  }

  measure: count {
    type: count
    drill_fields: [id, opportunity.count]
  }
}
