# Campaign Attribution


### Defining Attribution

Campaign Attribution is the main view file included here. The code uses several attribution models to calculate how a campaign gets credit for a person moving through various stage of the sales funnel (lead, opportunity, won opportunity, etc).  We have built out three different attribution models, but the logic can be customized to fit your desired model.  The three included are:

**First Touch:**
Using a first touch model, a campaign gets credit for a member if any of the following are true:

* If a campaign is the first campaign a person has ever responded to and they are not a contact associated with an opportunity, then that is a first touch. (This type of first touch represents most first touches.)

* If a campaign is the first campaign that any contact associated with an opportunity has responded to, then it is a first touch.

* If a campaign is the first campaign a person responds to after the close won date of another opportunity the same person was associated with, then it is a first touch.


**Last Touch MQL:**
LT here, is simply:

* The last touch before an opportunity created date

* Note, because of this, only leads converted to opportunities will have a last touch


**Multi-touch Linear:**
The logic for MT is also bit simpler than FT for this model:

* We only calculate multi-touch values for opportunity counts, active pipeline and closed won acv.

* If a person is not converted to a contact they have no multi-touch value.

* For an first opportunity, all the touches that come before that opportunity (on anyone associated with it) was created are eligible and get a Multi-Touch value. That value is 1 divided by the total number of eligible touches.

* If a touch has a Multi-Touch value from a prior opportunity then only the touches in between the prior close date and the close date of the later opportunity are eligible for credit from the second opportunity.


### Funnel Metrics

Funnel metrics use the attribution models we just calculated to determine how campaigns get credit for members who progress through the sales funnel. The standard funnel stages we have built out are (when applicable):

- All touches
- Opportunities
- Won Opportunites

**Note: many will have more stages they care about (for example, 'Qualified Lead').**


We've also included a set of dynamic funnel metrics which allow the user to filter for the specific attribution model (using the `attribution_selector` filter field) and dynamically change the fields included to those associated with that attribution model.


### Customizations

* Because Salesforce is highly customizable, there will likely be differences in fields included, field names, etc. that need to be updated here.  The demo dataset this is built off is a bit limited in fields.  For example, if you have a `who_id` for members, you can replace `coalesce(opportunity_id, coalesce(contact_id, lead_id))` with that.

* Similarly, you will likely have fields in the associated tables (Account, Campaign, Contact, Lead, Opportunity) that are not included here due to variations/customizatons in Salesforce. Include the fields that are meaninful to you and remove anything that is not.

* Of course, these attribution models may make sense for some and not for others. Choose an attribution model that reflects your company and what you're hoping to incentivize.

* As mentioned, funnel metrics will likely need to modified to include the sales stages that are relevant to your organization. With that in mind, you'll also likely want to customize or add conversion rate calculations. Often people will standardize these to a certain timeframe as well, which will depend on the length of your sales cycle.

* You may notice that ROI metrics are missing here.  This is obviously a key piece of understanding campaign performance. While the dataset this is built of off doesn't have this information, it's likely something you will want to build out.
