view: person {
  view_label: "C: Person"
  dimension: account_id {
    type: string
    # hidden: yes
    sql: coalesce(${lead.account_id}, ${contact.account_id}) ;;
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
    sql: coalesce(${lead.created_raw}, ${contact.created_raw}) ;;
  }

  dimension: current_customer_c {
    type: yesno
    sql:  coalesce(${lead.current_customer_c}, ${contact.current_customer_c}) ;;
  }

  dimension: department {
    type: string
    sql: coalesce(${lead.department_c}, ${contact.department}) ;;
  }

  dimension: email {
    type: string
    sql: coalesce(${lead.email}, ${contact.email}) ;;
  }

  dimension: grouping_c {
    type: string
    sql: coalesce(${lead.grouping_c}, ${contact.grouping_c});;
  }

  dimension: intro_meeting_c {
    type: yesno
    sql:  coalesce(${lead.intro_meeting_c}, ${contact.intro_meeting_c}) ;;
  }


  dimension: job_function_c {
    type: string
    sql: coalesce(${lead.job_function_c}, ${contact.job_function_c});;
  }

  dimension: name {
    type: string
    sql:coalesce(${lead.name}, ${contact.name})  ;;
  }


  dimension: territory_c {
    type: string
    sql:coalesce(${lead.territory_c}, ${contact.territory_c}) ;;
  }

  dimension: title {
    type: string
    sql: coalesce(${lead.title}, ${contact.title}) ;;
  }


  dimension: zendesk_organization {
    type: string
    sql: coalesce(${lead.zendesk_organization}, ${contact.zendesk_organization}) ;;
  }

  }
