view: contact {
  sql_table_name: public.contact ;;

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

  dimension: contact_type_c {
    type: string
    sql: ${TABLE}.contact_type_c ;;
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

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: department_picklist_c {
    type: string
    sql: ${TABLE}.department_picklist_c ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: grouping_c {
    type: string
    sql: ${TABLE}.grouping_c ;;
  }

  dimension: inbound_form_fillout_c {
    type: string
    sql: ${TABLE}.inbound_form_fillout_c ;;
  }

  dimension: intro_meeting_c {
    type: yesno
    sql: ${TABLE}.intro_meeting_c ;;
  }

  dimension: job_function_c {
    type: string
    sql: ${TABLE}.job_function_c ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: primary_contact_c {
    type: yesno
    sql: ${TABLE}.primary_contact_c ;;
  }

  dimension: qual_form_fillout_c {
    type: yesno
    sql: ${TABLE}.qual_form_fillout_c ;;
  }

  dimension: territory_c {
    type: string
    sql: ${TABLE}.territory_c ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
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
