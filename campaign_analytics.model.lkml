connection: "salesforce_demo"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: campaign_attribution {
  label: "Campaign Attribution"

  join: campaign {
    view_label: "A: Campaign"
    sql_on: ${campaign_attribution.campaign_id} = ${campaign.id} ;;
    relationship: many_to_one
  }

  join: lead {
    sql_on: ${campaign_attribution.lead_id} = ${lead.id} ;;
    relationship: many_to_one
    view_label: "C: Leads"
  }
  join: contact {
    sql_on:${campaign_attribution.contact_id} = ${contact.id}  ;;
    view_label: "D: Contacts"
    relationship: many_to_one
  }

  join: opportunity {
    view_label: "E: Opportunity"
    sql_on: ${lead.converted_opportunity_id} = ${opportunity.id} ;;
    relationship: many_to_one
  }
  join: account {
    view_label: "F: Account"
    sql_on: ${contact.account_id} = ${account.id} ;;
    relationship: many_to_one
  }
}
