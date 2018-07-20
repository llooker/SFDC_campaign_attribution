- dashboard: campaign_details
  title: Campaign Details
  layout: newspaper
  elements:
  - title: New Leads, Quarter over Quarter
    name: New Leads, Quarter over Quarter
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_line
    fields:
    - campaign_attribution.member_created_day_of_quarter
    - campaign_attribution.member_created_quarter
    - campaign_attribution.dynamic_att_all_touches
    pivots:
    - campaign_attribution.member_created_quarter
    fill_fields:
    - campaign_attribution.member_created_quarter
    filters: {}
    sorts:
    - campaign_attribution.member_created_day_of_quarter
    - campaign_attribution.member_created_quarter
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
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
    show_null_points: false
    interpolation: monotone
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    x_axis_label: Day of Quarter
    colors:
    - "#8cbbb1"
    - "#5fa998"
    - "#378371"
    - "#206252"
    - "#125342"
    - "#09362c"
    series_colors: {}
    listen:
      Campaign ID: campaign.id
      Attribution: campaign_attribution.attribution_selector
    row: 6
    col: 1
    width: 8
    height: 8
  - title: New Opps, Quarter over Quarter
    name: New Opps, Quarter over Quarter
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_line
    fields:
    - campaign_attribution.member_created_day_of_quarter
    - campaign_attribution.member_created_quarter
    - campaign_attribution.dynamic_att_opportunities
    pivots:
    - campaign_attribution.member_created_quarter
    fill_fields:
    - campaign_attribution.member_created_quarter
    filters: {}
    sorts:
    - campaign_attribution.member_created_day_of_quarter
    - campaign_attribution.member_created_quarter
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
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
    show_null_points: false
    interpolation: monotone
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    x_axis_label: Day of Quarter
    colors:
    - "#8cbbb1"
    - "#5fa998"
    - "#378371"
    - "#206252"
    - "#125342"
    - "#09362c"
    series_colors: {}
    listen:
      Campaign ID: campaign.id
      Attribution: campaign_attribution.attribution_selector
    row: 6
    col: 9
    width: 8
    height: 8
  - title: New Leads This Quarter
    name: New Leads This Quarter
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.member_created_quarter
    - campaign_attribution.dynamic_att_all_touches
    fill_fields:
    - campaign_attribution.member_created_quarter
    filters:
      campaign_attribution.member_created_quarter: 2 quarters
    sorts:
    - campaign_attribution.member_created_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: last_quarter
      label: Last Quarter
      expression: offset(${campaign_attribution.dynamic_att_all_touches},1)
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
      Campaign ID: campaign.id
      Attribution: campaign_attribution.attribution_selector
    row: 2
    col: 1
    width: 8
    height: 4
  - title: New Opps This Quarter
    name: New Opps This Quarter
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.member_created_quarter
    - campaign_attribution.dynamic_att_opportunities
    fill_fields:
    - campaign_attribution.member_created_quarter
    filters:
      campaign_attribution.member_created_week: 2 quarters
    sorts:
    - campaign_attribution.member_created_quarter desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: last_quarter
      label: Last Quarter
      expression: offset(${campaign_attribution.dynamic_att_opportunities},1)
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
      Campaign ID: campaign.id
      Attribution: campaign_attribution.attribution_selector
    row: 2
    col: 9
    width: 8
    height: 4
  - title: Won Opps
    name: Won Opps
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.dynamic_att_won_opportunities
    filters:
      campaign_attribution.member_created_week: 1 quarters
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
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
      Campaign ID: campaign.id
      Attribution: campaign_attribution.attribution_selector
    row: 2
    col: 17
    width: 6
    height: 4
  - title: Total Opp Pipeline This Quarter
    name: Total Opp Pipeline This Quarter
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.dynamic_att_opp_pipeline
    filters:
      campaign_attribution.member_created_week: 1 quarters
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
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
      Campaign ID: campaign.id
      Attribution: campaign_attribution.attribution_selector
    row: 6
    col: 17
    width: 6
    height: 4
  - title: Won ACV This Quarter
    name: Won ACV This Quarter
    model: campaign_analytics
    explore: campaign_attribution
    type: single_value
    fields:
    - campaign_attribution.dynamic_att_won_acv
    filters:
      campaign_attribution.member_created_week: 1 quarters
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
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
      Campaign ID: campaign.id
      Attribution: campaign_attribution.attribution_selector
    row: 10
    col: 17
    width: 6
    height: 4
  - name: ''
    type: text
    title_text: ''
    body_text: <font size="6" color="navy"> <center> Campaign Details </center>  </font>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Lead Conversion Rates
    name: Lead Conversion Rates
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_column
    fields:
    - campaign_attribution.member_created_week
    - campaign_attribution.dynamic_touch_to_won_conversion
    - campaign_attribution.dynamic_att_all_touches
    fill_fields:
    - campaign_attribution.member_created_week
    sorts:
    - campaign_attribution.member_created_week asc
    limit: 500
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
      - id: campaign_attribution.dynamic_att_all_touches
        name: 'B: Funnel Metrics  01. All Touches'
        axisId: campaign_attribution.dynamic_att_all_touches
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: campaign_attribution.dynamic_touch_to_won_conversion
        name: 'B: Funnel Metrics  Touch to Opp Conversion Rate'
        axisId: campaign_attribution.dynamic_touch_to_won_conversion
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    series_colors:
      campaign_attribution.dynamic_touch_to_won_conversion: "#206252"
    series_types:
      campaign_attribution.dynamic_touch_to_won_conversion: line
    colors:
    - "#8cbbb1"
    - "#5fa998"
    - "#378371"
    - "#206252"
    - "#125342"
    - "#09362c"
    column_spacing_ratio: 0.1
    column_group_spacing_ratio: 0.1
    listen:
      Campaign ID: campaign.id
      Attribution: campaign_attribution.attribution_selector
    row: 14
    col: 1
    width: 22
    height: 8
  - title: Lead Location
    name: Lead Location
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_geo_choropleth
    fields:
    - lead.state
    - campaign_attribution.dynamic_att_all_touches
    sorts:
    - campaign_attribution.dynamic_att_all_touches desc
    limit: 500
    column_limit: 50
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    map_value_colors:
    - "#8cbbb1"
    - "#5fa998"
    - "#378371"
    - "#206252"
    - "#125342"
    - "#09362c"
    colors:
    - "#8cbbb1"
    - "#5fa998"
    - "#378371"
    - "#206252"
    - "#125342"
    - "#09362c"
    listen:
      Campaign ID: campaign.id
      Attribution: campaign_attribution.attribution_selector
    row: 24
    col: 9
    width: 14
    height: 12
  - title: Top Ten Job Functions
    name: Top Ten Job Functions
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_pie
    fields:
    - person.job_function_c
    - campaign_attribution.dynamic_att_all_touches
    filters:
      person.job_function_c: "-NULL"
    sorts:
    - campaign_attribution.dynamic_att_all_touches desc
    limit: 10
    value_labels: legend
    label_type: labPer
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
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
      Campaign ID: campaign.id
      Attribution: campaign_attribution.attribution_selector
    row: 30
    col: 1
    width: 8
    height: 6
  - title: Top Ten Departments
    name: Top Ten Departments
    model: campaign_analytics
    explore: campaign_attribution
    type: looker_pie
    fields:
    - person.department
    - campaign_attribution.dynamic_att_all_touches
    filters:
      person.department: "-NULL"
    sorts:
    - campaign_attribution.dynamic_att_all_touches desc
    limit: 10
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
    listen:
      Campaign ID: campaign.id
      Attribution: campaign_attribution.attribution_selector
    row: 24
    col: 1
    width: 8
    height: 6
  - name: Lead Details
    type: text
    body_text: <font size="6" color="navy"> <center> Lead Details </center>  </font>
    row: 22
    col: 0
    width: 24
    height: 2
  - title: Table Details
    name: Table Details
    model: campaign_analytics
    explore: campaign_attribution
    type: table
    fields:
    - campaign_attribution.dynamic_att_all_touches
    - campaign_attribution.dynamic_att_opportunities
    - campaign_attribution.dynamic_att_won_opportunities
    - campaign_attribution.dynamic_att_opp_pipeline
    - campaign_attribution.dynamic_touch_to_won_conversion
    - campaign_attribution.dynamic_att_won_acv
    - campaign_attribution.member_created_quarter
    fill_fields:
    - campaign_attribution.member_created_quarter
    sorts:
    - campaign_attribution.member_created_quarter desc
    limit: 500
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
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
    point_style: none
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
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: White to Green
        colors:
        - "#FFFFFF"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
    listen:
      Campaign ID: campaign.id
      Attribution: campaign_attribution.attribution_selector
    row: 36
    col: 1
    width: 22
    height: 6
  filters:
  - name: Campaign ID
    title: Campaign ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: campaign_analytics
    explore: campaign_attribution
    listens_to_filters: []
    field: campaign.id
  - name: Attribution
    title: Attribution
    type: field_filter
    default_value: FT
    allow_multiple_values: true
    required: false
    model: campaign_analytics
    explore: campaign_attribution
    listens_to_filters: []
    field: campaign_attribution.attribution_selector
