- dashboard: campaign_lead_details
  title: Campaign Lead Details
  layout: newspaper
  elements:
  - title: Top Ten Lead Dept
    name: Top Ten Lead Dept
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_pie
    fields:
    - person.department
    - campaign_attribution.ft_all_leads
    filters:
      person.department: "-NULL"
    sorts:
    - campaign_attribution.ft_all_leads desc
    limit: 10
    value_labels: legend
    label_type: labPer
    inner_radius: 20
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#2196F3"
    - "#03A9F4"
    - "#00BCD4"
    - "#009688"
    - "#4CAF50"
    - "#8BC34A"
    - "#CDDC39"
    - "#FFEB3B"
    - "#9E9E9E"
    - "#607D8B"
    - "#607D8B"
    series_colors: {}
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
      Date: campaign_attribution.member_created_date
    row: 12
    col: 0
    width: 8
    height: 7
  - title: Top Ten Lead Job Titles
    name: Top Ten Lead Job Titles
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_pie
    fields:
    - person.job_function_c
    - campaign_attribution.ft_all_leads
    filters:
      person.job_function_c: "-NULL"
    sorts:
    - campaign_attribution.ft_all_leads desc
    limit: 10
    column_limit: 10
    value_labels: legend
    label_type: labPer
    inner_radius: 20
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#2196F3"
    - "#03A9F4"
    - "#00BCD4"
    - "#009688"
    - "#4CAF50"
    - "#8BC34A"
    - "#CDDC39"
    - "#FFEB3B"
    - "#9E9E9E"
    - "#607D8B"
    - "#607D8B"
    series_colors: {}
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
      Date: campaign_attribution.member_created_date
    row: 20
    col: 0
    width: 8
    height: 7
  - title: Conversion Rates by Business Segment and Lead's Department
    name: Conversion Rates by Business Segment and Lead's Department
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_column
    fields:
    - person.department
    - lead.segment
    - opportunity.lead_to_opp_4wks_conversion
    pivots:
    - lead.segment
    filters:
      person.department: "-NULL"
      campaign.type: ''
      lead.segment: ''
    sorts:
    - lead.segment 0
    - opportunity.lead_to_opp_4wks_conversion desc 4
    limit: 500
    column_limit: 50
    row_total: right
    stacking: normal
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#2196F3"
    - "#03A9F4"
    - "#00BCD4"
    - "#009688"
    - "#4CAF50"
    - "#8BC34A"
    - "#CDDC39"
    - "#FFEB3B"
    - "#9E9E9E"
    - "#607D8B"
    - "#607D8B"
    show_value_labels: false
    label_density: 25
    font_size: ''
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      1. SMB - opportunity.lead_to_opp_4wks_conversion: "#1f78b4"
      2. MM - opportunity.lead_to_opp_4wks_conversion: "#2196F3"
      3. COM - opportunity.lead_to_opp_4wks_conversion: "#00BCD4"
      4. ENT - opportunity.lead_to_opp_4wks_conversion: "#a6cee3"
    series_types: {}
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
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
    plot_size_by_field: false
    trend_lines: []
    ordering: none
    show_null_labels: false
    column_spacing_ratio: 0
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Date: campaign_attribution.member_created_date
    row: 12
    col: 8
    width: 16
    height: 7
  - title: FT Leads, Year Over Year
    name: FT Leads, Year Over Year
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_line
    fields:
    - campaign_attribution.ft_all_leads
    - campaign_attribution.member_created_year
    - campaign_attribution.member_created_month_num
    pivots:
    - campaign_attribution.member_created_year
    fill_fields:
    - campaign_attribution.member_created_year
    - campaign_attribution.member_created_month_num
    sorts:
    - campaign_attribution.member_created_year
    - campaign_attribution.member_created_month_num
    limit: 500
    column_limit: 50
    stacking: normal
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#2196F3"
    - "#03A9F4"
    - "#00BCD4"
    - "#009688"
    - "#4CAF50"
    - "#8BC34A"
    - "#CDDC39"
    - "#FFEB3B"
    - "#9E9E9E"
    - "#607D8B"
    - "#607D8B"
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Member Created Month
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: false
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 4
    col: 17
    width: 7
    height: 8
  - title: Lead Create to Opp Won Cohort Analysis
    name: Lead Create to Opp Won Cohort Analysis
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_line
    fields:
    - campaign_attribution.member_created_month
    - campaign_attribution.lead_created_to_opportunity_close_delta_month
    - opportunity.count
    pivots:
    - campaign_attribution.member_created_month
    fill_fields:
    - campaign_attribution.member_created_month
    filters:
      campaign_attribution.member_created_month: 12 months
      campaign_attribution.lead_created_to_opportunity_close_delta_month: "[0, 12]"
    sorts:
    - campaign_attribution.member_created_month
    - campaign_attribution.lead_created_to_opportunity_close_delta_month
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - table_calculation: percent
      label: Percent
      expression: "${opportunity.count}/${opportunity.count:total}"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    stacking: normal
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#2196F3"
    - "#03A9F4"
    - "#00BCD4"
    - "#009688"
    - "#4CAF50"
    - "#8BC34A"
    - "#CDDC39"
    - "#FFEB3B"
    - "#9E9E9E"
    - "#607D8B"
    - "#607D8B"
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: 2017-07
        name: 2017-07
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 469
      - id: 2017-08
        name: 2017-08
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 474
      - id: 2017-09
        name: 2017-09
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 479
      - id: 2017-10
        name: 2017-10
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 484
      - id: 2017-11
        name: 2017-11
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 489
      - id: 2017-12
        name: 2017-12
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 494
      - id: 2018-01
        name: 2018-01
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 499
      - id: 2018-02
        name: 2018-02
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 504
      - id: 2018-03
        name: 2018-03
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 509
      - id: 2018-04
        name: 2018-04
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 514
      - id: 2018-05
        name: 2018-05
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 519
      - id: 2018-06
        name: 2018-06
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 524
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      maxValue:
      __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
      __LINE_NUM: 466
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
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 435
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
      __LINE_NUM: 430
    hidden_fields:
    - opportunity.count
    column_spacing_ratio:
    listen: {}
    row: 20
    col: 8
    width: 16
    height: 7
  - title: FT vs LT MQL Lead Counts
    name: FT vs LT MQL Lead Counts
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_column
    fields:
    - campaign_attribution.member_created_month
    - campaign_attribution.mql_touch_count
    - campaign_attribution.ft_all_leads
    fill_fields:
    - campaign_attribution.member_created_month
    sorts:
    - campaign_attribution.member_created_month
    limit: 500
    column_limit: 50
    stacking: ''
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#2196F3"
    - "#03A9F4"
    - "#00BCD4"
    - "#009688"
    - "#4CAF50"
    - "#8BC34A"
    - "#CDDC39"
    - "#FFEB3B"
    - "#9E9E9E"
    - "#607D8B"
    - "#607D8B"
    - "#607D8B"
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      campaign_attribution.ft_all_leads: "#a6cee3"
      campaign_attribution.mql_touch_count: "#1f78b4"
    series_types:
      campaign_attribution.mql_touch_count: line
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: campaign_attribution.ft_all_leads
        name: 'B: Funnel Metrics 01. First Touches (FTs)'
        axisId: campaign_attribution.ft_all_leads
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 586
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
      __LINE_NUM: 583
    - label:
      orientation: right
      series:
      - id: campaign_attribution.mql_touch_count
        name: 'B: Funnel Metrics 01. MQL Touches'
        axisId: campaign_attribution.mql_touch_count
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 598
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
      __LINE_NUM: 595
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
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 4
    col: 10
    width: 7
    height: 8
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      <font size="5" color= "black"><center>Campaign Performance by Lead Attribution</center></font>
      <font size="4"><center><i>Broken out by Lead Department, Job function, Segment </center></i></font>
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Opp Conversion Rate (4Wks)
    name: Opp Conversion Rate (4Wks)
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - opportunity.lead_to_opp_4wks_conversion
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: "#5F74BB"
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    series_colors: {}
    hide_legend: true
    y_axes:
    - label: ''
      orientation: bottom
      series:
      - id: opportunity.lead_to_opp_4wks_conversion
        name: 'D: Opportunity Lead to Opp 4wks Conversion'
        axisId: opportunity.lead_to_opp_4wks_conversion
        __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
        __LINE_NUM: 678
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: salesforce_campaign_analytics/campaign_lead_details.dashboard.lookml
      __LINE_NUM: 675
    font_size: 16px
    colors:
    - 'palette: Green to Red'
    listen: {}
    row: 8
    col: 5
    width: 5
    height: 4
  - title: Avg Lead to Opp Velocity
    name: Avg Lead to Opp Velocity
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.avg_days_between_campaign_and_opportunity_created
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    listen: {}
    row: 8
    col: 0
    width: 5
    height: 4
  - title: Leads This Quarter
    name: Leads This Quarter
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.ft_all_leads
    - person.created_quarter
    fill_fields:
    - person.created_quarter
    filters:
      person.created_quarter: 2 quarters
    sorts:
    - person.created_quarter desc
    limit: 500
    dynamic_fields:
    - table_calculation: last_quarter
      label: Last Quarter
      expression: offset(${campaign_attribution.ft_all_leads},1)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: percent_change
      label: Percent Change
      expression: "${campaign_attribution.ft_all_leads}/${last_quarter} -1"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Last Quarter
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: [last_quarter]
    listen: {}
    row: 4
    col: 0
    width: 5
    height: 4
  - title: MQL Touches
    name: MQL Touches
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.mql_touch_count
    - person.created_quarter
    fill_fields:
    - person.created_quarter
    filters:
      person.created_quarter: 4 quarters
    sorts:
    - person.created_quarter desc
    limit: 500
    dynamic_fields:
    - table_calculation: mql_touches
      label: MQL Touches
      expression: offset(${campaign_attribution.mql_touch_count},1)
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Last Quarter
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen: {}
    row: 4
    col: 5
    width: 5
    height: 4
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 1 quarters
    allow_multiple_values: true
    required: false
