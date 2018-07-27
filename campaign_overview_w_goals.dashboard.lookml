- dashboard: campaign_overview_w_goals
  title: Campaign Overview
  layout: newspaper

  elements:

  - title: "% Lead Goal"
    name: "% Lead Goal"
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.ft_all_leads
    filters:
      campaign_attribution.member_created_date: 1 quarters
    limit: 500
    dynamic_fields:
    - table_calculation: lead_goal
      label: Lead Goal
      expression: "${campaign_attribution.ft_all_leads}*1.1"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: lead_to_goal
      label: "%Lead to Goal"
      expression: "${campaign_attribution.ft_all_leads}/${lead_goal}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#89B0AE"
    show_single_value_title: false
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - lead_to_goal
    show_dropoff: true
    series_types: {}
    comparison_label: Lead Target
    listen:
      Campaign Type: campaign.type
      Business Segment: lead.segment
    row: 9
    col: 1
    width: 4
    height: 3

  - title: Campaign Funnel
    name: Campaign Funnel
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_column
    fields:
    - campaign_attribution.ft_all_leads
    - campaign_attribution.ft_campaign_opportunity_count
    - campaign_attribution.ft_campaign_closed_won_count
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: campaign_attribution.ft_campaign_opportunity_count
        name: 'C: Funnel Metrics 04. FT Opportunities'
        axisId: campaign_attribution.ft_campaign_opportunity_count
      - id: campaign_attribution.ft_campaign_closed_won_count
        name: 'C: Funnel Metrics 07. FT Won Opportunities'
        axisId: campaign_attribution.ft_campaign_closed_won_count
      - id: campaign_attribution.ft_all_leads
        name: 'C: Funnel Metrics 01. First Touches (FTs)'
        axisId: campaign_attribution.ft_all_leads
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: custom
      tickDensityCustom: 6
      type: linear
      maxValue:
      minValue: -10000
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    show_dropoff: true
    series_colors:
      campaign_attribution.ft_all_leads: "#99B1DD"
      campaign_attribution.ft_routed_total_lead_count: "#70A0AF"
      campaign_attribution.ft_campaign_opportunity_count: "#89B0AE"
      campaign_attribution.ft_campaign_closed_won_count: "#A0C1B9"
      campaign_attribution.dynamic_att_all_touches: "#99B1DD"
      campaign_attribution.dynamic_att_routed_leads: "#70A0AF"
      campaign_attribution.dynamic_att_opportunities: "#89B0AE"
      campaign_attribution.dynamic_att_won_opportunities: "#A0C1B9"
    colors:
    - "#1D98D3"
    - "#ff4085"
    - "#27C5FF"
    - "#ded314"
    - "#4CAF50"
    - "#f58a0c"
    - "#7e64e0"
    - "#603535"
    - "#A5C740"
    - "#B54B4B"
    - "#B1B0B0"
    - "#44c7d4"
    listen:
      Campaign Type: campaign.type
      Business Segment: lead.segment
    row: 18
    col: 1
    width: 14
    height: 9


  - title: Recent Campaign Performance
    name: Recent Campaign Performance
    model: campaign_analytics
    explore: campaign_attribution
    type: table
    fields: [campaign.id, campaign_attribution.ft_all_leads, campaign_attribution.ft_campaign_opportunity_count,
      campaign_attribution.ft_campaign_closed_won_count, campaign_attribution.ft_lead_to_opp_create_conversion_rate,
      campaign_attribution.ft_campaign_opportunity_pipeline, campaign_attribution.ft_to_opp_won_conversion_rate,
      campaign_attribution.ft_campaign_closed_won_total_acv]
    filters:
      campaign.created_date: 6 months
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: true
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: campaign_attribution.ft_campaign_opportunity_count
        name: 'C: Funnel Metrics 04. FT Opportunities'
        axisId: campaign_attribution.ft_campaign_opportunity_count
      - id: campaign_attribution.ft_campaign_closed_won_count
        name: 'C: Funnel Metrics 07. FT Won Opportunities'
        axisId: campaign_attribution.ft_campaign_closed_won_count
      - id: campaign_attribution.ft_all_leads
        name: 'C: Funnel Metrics 01. First Touches (FTs)'
        axisId: campaign_attribution.ft_all_leads
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    show_dropoff: false
    series_types: {}
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields: []
    hidden_fields:
    - campaign.type
    listen:
      Campaign Type: campaign.type
      Business Segment: lead.segment
    row: 47
    col: 1
    width: 22
    height: 11

  - title: New Opps
    name: New Opps
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_area
    fields:
    - opportunity.created_week
    - campaign_attribution.ft_campaign_opportunity_count
    fill_fields:
    - opportunity.created_week
    filters:
      opportunity.created_week: this quarter
    sorts:
    - opportunity.created_week
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: new_opportunities
      label: New Opportunities
      expression: if(${opportunity.created_week}>now(), null,
        running_total(${campaign_attribution.ft_campaign_opportunity_count}))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: goal
      label: Goal
      expression: |-
        #Input Goal Calculation Here************

        running_total(200) + if(is_null(${campaign_attribution.ft_campaign_opportunity_count}*0), 0, ${campaign_attribution.ft_campaign_opportunity_count}*0)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: false
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields:
    - campaign_attribution.ft_campaign_opportunity_count
    series_types:
      goal: line
    series_colors:
      goal: black
      new_ft_opportunities: "#4F78E8"
      new_opportunities: "#70A0AF"
    trend_lines:
    - color: black
      label_position: right
      period: 7
      regression_type: linear
      series_index: 2
      show_label: true
      label_type: string
      label: Goal
    listen:
      Campaign Type: campaign.type
      Business Segment: lead.segment
    row: 6
    col: 11
    width: 6
    height: 9
  - title: New Won ACV
    name: New Won ACV
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_area
    fields:
    - campaign_attribution.opportunity_created_week
    - campaign_attribution.ft_campaign_closed_won_total_acv
    fill_fields:
    - campaign_attribution.opportunity_created_week
    filters:
      campaign_attribution.opportunity_created_week: this quarter
    sorts:
    - campaign_attribution.opportunity_created_week
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: won_acv
      label: Won ACV
      expression: if(${campaign_attribution.opportunity_created_week}>now(), null,
        running_total(${campaign_attribution.ft_campaign_closed_won_total_acv}))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: goal
      label: Goal
      expression: |-
        #Input Goal Calculation Here

        running_total(10000) + if(is_null(${campaign_attribution.ft_campaign_closed_won_total_acv}*0),0,${campaign_attribution.ft_campaign_closed_won_total_acv}*0)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: false
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields:
    - campaign_attribution.ft_campaign_closed_won_total_acv
    series_types:
      goal: line
    series_colors:
      goal: black
      new_ft_opportunities: "#4F78E8"
      won_acv: "#70A0AF"
    trend_lines:
    - color: black
      label_position: right
      period: 7
      regression_type: linear
      series_index: 2
      show_label: true
      label_type: string
      label: Goal
    hidden_series: []
    listen:
      Campaign Type: campaign.type
      Business Segment: lead.segment
    row: 6
    col: 17
    width: 6
    height: 9
  - title: New Leads
    name: New Leads
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_area
    fields:
    - campaign_attribution.member_created_week
    - campaign_attribution.ft_all_leads
    fill_fields:
    - campaign_attribution.member_created_week
    filters:
      campaign_attribution.member_created_week: this quarter
    sorts:
    - campaign_attribution.member_created_week
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: new_leads
      label: New Leads
      expression: if(${campaign_attribution.member_created_week}>now(), null, running_total(${campaign_attribution.ft_all_leads}))
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: goal
      label: Goal
      expression: |-
        #Input Goal Calculation Here

        running_total(10000) + if(is_null(${campaign_attribution.ft_all_leads}*0),0,${campaign_attribution.ft_all_leads}*0)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: false
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields:
    - campaign_attribution.ft_all_leads
    series_types:
      goal: line
    series_colors:
      new_ft_leads: "#2d6cda"
      goal: black
      new_leads: "#70A0AF"
      campaign_attribution.ft_all_leads: "#70A0AF"
    trend_lines:
    - color: "#080808"
      label_position: right
      period: 7
      regression_type: linear
      series_index: 2
      show_label: true
      label_type: string
      label: Goal
    hidden_series: []
    listen:
      Campaign Type: campaign.type
      Business Segment: lead.segment
    row: 6
    col: 5
    width: 6
    height: 9
  - title: Untitled
    name: Untitled
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - opportunity.day_of_current_quarter
    - opportunity.days_left_in_quarter
    sorts:
    - opportunity.day_of_current_quarter
    limit: 500
    dynamic_fields:
    - table_calculation: calculation_2
      label: Calculation 2
      expression: "(${opportunity.days_left_in_quarter}+${opportunity.day_of_current_quarter})"
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: number
    custom_color_enabled: true
    custom_color: "#7d76c2"
    show_single_value_title: false
    show_comparison: true
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - opportunity.days_left_in_quarter
    comparison_label: Day of Current Quarter
    listen:
      Campaign Type: campaign.type
      Business Segment: lead.segment
    row: 6
    col: 1
    width: 4
    height: 3
  - title: "% Opp Goal"
    name: "% Opp Goal"
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.dynamic_att_opportunities
    filters:
      campaign_attribution.member_created_date: 1 quarters
      campaign_attribution.attribution_selector: FT
    limit: 500
    dynamic_fields:
    - table_calculation: opp_to_goal
      label: "%Opp to Goal"
      expression: "${campaign_attribution.dynamic_att_opportunities}/${goal}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: goal
      label: Goal
      expression: "${campaign_attribution.dynamic_att_opportunities}*1.2"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#99B1DD"
    show_single_value_title: false
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - lead_to_goal
    - opp_to_goal
    show_dropoff: true
    series_types: {}
    comparison_label: Opp Target
    listen:
      Campaign Type: campaign.type
      Business Segment: lead.segment
    row: 12
    col: 1
    width: 4
    height: 3
  - name: 'Title'
    type: text
    title_text: ''
    body_text: <font size="6" color= "navy"><center>Campaign Forecast </center></font>
    row: 4
    col: 0
    width: 24
    height: 2
  - name: 'Subtitle'
    type: text
    title_text: ''
    body_text: |-
      <font color="Navy" size="6"><center>  Campaign Funnel Metrics </center></font>
      <font  size="4"><center>  <i> Using a First Touch Attribution Model </i>  </center></font>
    row: 15
    col: 0
    width: 24
    height: 3
  - title: Opportunity Pipeline
    name: Opportunity Pipeline
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.ft_campaign_opportunity_pipeline
    - campaign_attribution.member_created_quarter
    filters:
      campaign_attribution.member_created_date: 2 quarters
    sorts:
    - campaign_attribution.member_created_quarter desc
    limit: 500
    dynamic_fields:
    - table_calculation: last_quarter
      label: Last Quarter
      expression: offset(${campaign_attribution.ft_campaign_opportunity_pipeline},1)
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - campaign_attribution.member_created_quarter
    listen:
      Campaign Type: campaign.type
      Business Segment: lead.segment
    row: 0
    col: 1
    width: 8
    height: 4
  - title: Won ACV
    name: Won ACV
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.ft_campaign_closed_won_total_acv
    - campaign_attribution.member_created_quarter
    filters:
      campaign_attribution.ft_campaign_closed_won_total_acv: ">0"
      campaign_attribution.member_created_quarter: 5 quarters
    sorts:
    - campaign_attribution.member_created_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: last_quarter
      label: Last Quarter
      expression: offset(${campaign_attribution.ft_campaign_closed_won_total_acv},1)
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Campaign Type: campaign.type
      Business Segment: lead.segment
    row: 0
    col: 16
    width: 7
    height: 4
  - title: New Opps Created This Quarter
    name: New Opps Created This Quarter
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.opportunity_created_quarter
    - campaign_attribution.ft_campaign_opportunity_count
    fill_fields:
    - campaign_attribution.opportunity_created_quarter
    filters:
      campaign_attribution.opportunity_created_quarter: 2 quarters
    sorts:
    - campaign_attribution.opportunity_created_quarter desc
    limit: 500
    dynamic_fields:
    - table_calculation: previous_quarter
      label: Previous Quarter
      expression: offset(${campaign_attribution.ft_campaign_opportunity_count},1)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    comparison_label: Last Quarter
    listen:
      Campaign Type: campaign.type
      Business Segment: lead.segment
    row: 0
    col: 9
    width: 7
    height: 4

  - title: Active Campaigns
    name: Active Campaigns
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_timeline
    fields:
    - campaign.id
    - campaign.start_date
    - campaign.end_date
    filters:
      campaign.is_active: 'Yes'
      campaign.start_date: 14 days ago for 21 days
    sorts:
    - campaign.start_date desc
    limit: 20
    column_limit: 50
    barColors:
    - "#89B0AE"
    - "#FFA971"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Campaign Type: campaign.type
      Business Segment: lead.segment
    row: 18
    col: 15
    width: 8
    height: 9


  filters:
  - name: Campaign Type
    title: Campaign Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: campaign_analytics
    explore: campaign_attribution
    listens_to_filters: []
    field: campaign.type
  - name: Business Segment
    title: Business Segment
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: campaign_analytics
    explore: campaign_attribution
    listens_to_filters: []
    field: lead.segment
