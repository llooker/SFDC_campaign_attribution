view: contact {
  sql_table_name: public.contact ;;
  view_label: "C: Person"

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    group_label: "Contact Specific Attributes"
    type: string
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: contact_type_c {
    group_label: "Contact Specific Attributes"
    type: string
    sql: ${TABLE}.contact_type_c ;;
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
    group_label: "Contact Specific Attributes"
    type: yesno
    sql: ${TABLE}.current_customer_c ;;
  }

  dimension: department {
    hidden: yes
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: department_picklist_c {
    hidden: yes
    type: string
    sql: ${TABLE}.department_picklist_c ;;
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

  dimension: inbound_form_fillout_c {
    group_label: "Contact Specific Attributes"
    type: string
    sql: ${TABLE}.inbound_form_fillout_c ;;
  }

  dimension: intro_meeting_c {
    hidden: yes
    type: yesno
    sql: ${TABLE}.intro_meeting_c ;;
  }

  dimension: job_function_c {
    hidden: yes
    type: string
    sql: ${TABLE}.job_function_c ;;
  }

  dimension: lead_source {
    group_label: "Contact Specific Attributes"
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: primary_contact_c {
    group_label: "Contact Specific Attributes"
    type: yesno
    sql: ${TABLE}.primary_contact_c ;;
  }

  dimension: qual_form_fillout_c {
    group_label: "Contact Specific Attributes"
    type: yesno
    sql: ${TABLE}.qual_form_fillout_c ;;
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

  dimension: zendesk_organization {
    hidden: yes
    type: string
    sql: ${TABLE}.zendesk_organization ;;
  }

  measure: contact_count {
    type: count
    drill_fields: [id, name, account.name, account.id]
  }
}
