- dashboard: campaign_lead_details
  title: 'Campaign Lead Details'
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
    inner_radius: 20
    colors:
    - 'palette: Green to Red'
    series_colors: {}
    listen:
      Date: campaign_attribution.member_created_date
    row: 16
    col: 6
    width: 7
    height: 8
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
    inner_radius: 20
    colors:
    - 'palette: Green to Red'
    series_colors: {}
    listen:
      Date: campaign_attribution.member_created_date
    row: 24
    col: 6
    width: 7
    height: 8
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
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: true
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
    show_dropoff: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    column_spacing_ratio: 0
    hidden_fields: []
    trend_lines: []
    font_size: ''
    series_colors:
      3. COM - opportunity.lead_to_opp_create_conversion: "#FFA971"
      2. MM - opportunity.lead_to_opp_create_conversion: "#FFD371"
      4. ENT - opportunity.lead_to_opp_create_conversion: "#5F74BB"
      3. COM - opportunity.lead_to_opp_4wks_conversion: "#FFA971"
      2. MM - opportunity.lead_to_opp_4wks_conversion: "#FFD371"
      4. ENT - opportunity.lead_to_opp_4wks_conversion: "#5F74BB"
    series_types: {}
    colors:
    - "#4FB39F"
    - "#3B4260"
    - "#39A736"
    - "#F3BF0E"
    - "#E57200"
    - "#5DCCCC"
    - "#7e64e0"
    - "#603535"
    - "#A5C740"
    - "#B54B4B"
    - "#B1B0B0"
    - "#44c7d4"
    listen:
      Date: campaign_attribution.member_created_date
    row: 16
    col: 13
    width: 11
    height: 8
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
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_series: []
    colors:
    - "#2fd1e2"
    - "#fba669"
    - "#c47d82"
    - "#FFA971"
    - "#FFD371"
    - "#bdece0"
    - "#A0C1B9"
    - "#70A0AF#89B0AE"
    - "#5F74BB"
    - "#4D6C97"
    - "#3D6D9E"
    series_colors: {}
    x_axis_label: Member Created Month
    row: 8
    col: 6
    width: 9
    height: 8
  - title: Leads by Campaign Type
    name: Leads by Campaign Type
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_area
    fields:
    - campaign.type
    - campaign_attribution.ft_all_leads
    - opportunity.lead_to_opp_4wks_conversion
    filters:
      campaign.type: ''
      lead.segment: ''
    sorts:
    - campaign_attribution.ft_all_leads desc
    limit: 500
    column_limit: 50
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
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    hidden_fields: []
    show_dropoff: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: campaign_attribution.ft_all_leads
        name: 01. First Touches (FTs)
        axisId: campaign_attribution.ft_all_leads
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 122
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
      __LINE_NUM: 119
    - label:
      orientation: right
      series:
      - id: opportunity.lead_to_opp_4wks_conversion
        name: Lead to Opp 4wks Conversion
        axisId: opportunity.lead_to_opp_4wks_conversion
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 133
      - id: campaign_attribution.ft_lead_to_opp_create_conversion_rate
        name: Ft Lead to Opp Create Conversion Rate
        axisId: campaign_attribution.ft_lead_to_opp_create_conversion_rate
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 136
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
      __LINE_NUM: 130
    series_labels:
      campaign_attribution.ft_campaign_opportunity_count: Opp Count
      opportunity.lead_to_opp_4wks_conversion: Lead to Opp Conversion Rate (4 weeks)
    series_colors:
      opportunity.lead_to_opp_4wks_conversion: "#A0C1B9"
    series_types:
      campaign_attribution.ft_campaign_opportunity_count: column
      campaign_attribution.dynamic_att_opportunities: column
      campaign_attribution.ft_all_leads: column
    hidden_series:
    - campaign_attribution.ft_lead_to_opp_create_conversion_rate
    colors:
    - "#5F74BB"
    - "#FFA971"
    - "#89B0AE"
    - "#A0C1B9"
    - "#FFD371"
    - "#5F74BB"
    - "#4FB39F"
    - "#FFA971"
    listen:
      Date: campaign_attribution.member_created_date
    row: 8
    col: 15
    width: 9
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
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
    series_types: {}
    hidden_series: []
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
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1100
      bold: false
      italic: false
      strikethrough: false
      fields:
      __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
      __LINE_NUM: 1095
    hidden_fields:
    - opportunity.count
    column_spacing_ratio:
    colors:
    - 'palette: Tomato to Steel Blue'
    series_colors:
      2017-08 - percent: "#2fd1e2"
      2017-07 - percent: "#706acb"
      2018-05 - percent: "#5F74BB"
      2018-04 - percent: "#70A0AF"
      2018-03 - percent: "#89B0AE"
      2018-02 - percent: "#A0C1B9"
      2018-01 - percent: "#bdece0"
      2017-12 - percent: "#FFD371"
      2017-11 - percent: "#FFA971"
      2017-10 - percent: "#c47d82"
      2017-09 - percent: "#fba669"
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: 2017-07
        name: 2017-07
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1130
      - id: 2017-08
        name: 2017-08
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1133
      - id: 2017-09
        name: 2017-09
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1136
      - id: 2017-10
        name: 2017-10
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1139
      - id: 2017-11
        name: 2017-11
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1142
      - id: 2017-12
        name: 2017-12
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1145
      - id: 2018-01
        name: 2018-01
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1148
      - id: 2018-02
        name: 2018-02
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1151
      - id: 2018-03
        name: 2018-03
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1154
      - id: 2018-04
        name: 2018-04
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1157
      - id: 2018-05
        name: 2018-05
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1160
      - id: 2018-06
        name: 2018-06
        axisId: percent
        __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
        __LINE_NUM: 1163
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      maxValue:
      __FILE: salesforce_campaign_analytics/campaign_overview_w_goals.dashboard.lookml
      __LINE_NUM: 1127
    row: 24
    col: 13
    width: 11
    height: 8
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
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: campaign_attribution.ft_all_leads
        name: 'B: Funnel Metrics 01. First Touches (FTs)'
        axisId: campaign_attribution.ft_all_leads
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: campaign_attribution.mql_touch_count
        name: 'B: Funnel Metrics 01. MQL Touches'
        axisId: campaign_attribution.mql_touch_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    colors:
    - 'palette: Default'
    series_colors:
      campaign_attribution.mql_touch_count: "#5F74BB"
      campaign_attribution.ft_all_leads: "#4FB39F"
    series_types:
      campaign_attribution.mql_touch_count: line
    # listen:
    #   Date: campaign_attribution.member_created_date
    row: 0
    col: 6
    width: 18
    height: 8
  - name: 'Campaign Performance'
    type: text
    title_text: ''
    body_text: |-
      <font size="6" color= "black"><center>Campaign Performance by Lead Attribution</center></font>
      <font size="4"><center><i>Broken out by Lead Department, Job function, Segment </center></i></font>
    row: 16
    col: 0
    width: 6
    height: 16
  - title: Lead to Opp Conversion Rate (4Wks)
    name: Lead to Opp Conversion Rate (4Wks)
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
      showLabels: false
      showValues: false
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    font_size: 16px
    colors:
    - 'palette: Green to Red'
    listen: {}
    row: 8
    col: 0
    width: 6
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
    row: 12
    col: 0
    width: 6
    height: 4
  - name: 'title'
    type: text
    body_text: |-
      <font size="6" color="black"><center> <b>Campaign Lead Attribution    </b></center></font>
      <font size="4" ><center>Including leads broken out by first touch attribution counts, last touch attribution counts, and conversions rates over time</center></font>
    row: 0
    col: 0
    width: 6
    height: 8
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 1 quarters
    allow_multiple_values: true
    required: false
