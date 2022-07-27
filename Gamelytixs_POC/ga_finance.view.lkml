# The name of this view in Looker is "Ga Finance"
view: ga_finance {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".GA_FINANCE
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Avg App Open Rate" in Explore.

  dimension: avg_app_open_rate {
    type: number
    sql: ${TABLE}.AVG_APP_OPEN_RATE ;;
  }

  dimension: avg_playtime {
    type: number
    sql: ${TABLE}.AVG_PLAYTIME ;;
  }

  dimension: avg_screens_per_visit {
    type: number
    sql: ${TABLE}.AVG_SCREENS_PER_VISIT ;;
  }

  dimension: avg_session_length_sec {
    type: number
    sql: ${TABLE}.AVG_SESSION_LENGTH_SEC ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_session_length_sec {
    type: sum
    sql: ${avg_session_length_sec} ;;
  }

  measure: average_avg_session_length_sec {
    type: average
    sql: ${avg_session_length_sec} ;;
      }
  # measure: average_avg_session_length_sec1 {
  #   type: average
  #   sql: concat(${avg_session_length_sec},' ','Sec');;
  # }

  dimension: churn_rate {
    type: number
    sql: ${TABLE}.CHURN_RATE ;;
  }

  dimension: conversion_rate {
    type: number
    sql: ${TABLE}.CONVERSION_RATE ;;
  }

  dimension: cost_per_install {
    type: number
    sql: ${TABLE}.COST_PER_INSTALL ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date_ {
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
    sql: ${TABLE}.DATE_ ;;
  }

  dimension: dau {
    type: number
    sql: ${TABLE}.DAU ;;
  }

  dimension: dau_per_mau {
    type: number
    sql: ${TABLE}.DAU_PER_MAU ;;
  }

  dimension: game {
    type: string
    sql: ${TABLE}.GAME ;;
  }

  dimension: ltv {
    type: number
    sql: ${TABLE}.LTV ;;
  }

  dimension: mau {
    type: number
    sql: ${TABLE}.MAU ;;
    primary_key: yes
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}.NEW_USERS ;;
  }
  measure: New_Users {
    type: sum
    sql: ${new_users} ;;
  }
  measure: ROI_TARGET_PERCENT {
    type: average
    sql: ${roi_target_percent} ;;
    #value_format: "0.0%"
    value_format_name: percent_1
  }
  filter: month_filter1 {
    type: date
    #suggestions: ["01-02-2020"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]

  }

  dimension: Start_Date {
    type: string
    sql: '2020-01-01' ;;

  }

  dimension: End_Date {
    type: string
    sql: case when {% condition month_filter1 %} to_date(${date__date},'yyyy-mm-dd') {% endcondition %} then ${date__date} end ;;

  }


  measure: Last12month_NewUsers {
    type: average
    sql:case when ${date__date}>=${Start_Date} and to_date(${date__date},'yyyy-mm-dd')<{% date_end month_filter1 %} then 1 else 0 end  ;;
   # value_format: "0.0"

  }
    measure: Last12month_NewUsers1 {
    type: number
    sql: case when ${Last12month_NewUsers}=1 then
      sum(${new_users}) else null end;;
    value_format: "0"
  }

  measure: Last12month_ReturningUsers {
    type: average
    sql:case when ${date__date}>= ${Start_Date} and to_date(${date__date},'yyyy-mm-dd')<{% date_end month_filter1 %} then 1 else 0 end  ;;
   # value_format: "0.0"

  }
  measure: Last12month_ReturningUsers1 {
    type: number
    sql: case when ${Last12month_ReturningUsers}=1 then
      sum(${returning_users}) else null end;;
    value_format: "0"
  }
  # measure: Last12month_ReturningUsers1 {
  #   type: number
  #   sql: case when ${Last12month_ReturningUsers}=1 then
  #     sum(${ga_finance.avg_session_length_sec}) else null end;;
  #   value_format: "0.0"
  # }
  measure: Returning_Users {
    type: sum
    sql: ${returning_users} ;;
  }
  dimension: organic_conversion {
    type: number
    sql: ${TABLE}.ORGANIC_CONVERSION ;;
  }

  dimension: paid_conversion {
    type: number
    sql: ${TABLE}.PAID_CONVERSION ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.PLATFORM ;;
  }

  dimension: retention_rate {
    type: number
    sql: ${TABLE}.RETENTION_RATE ;;
  }

  dimension: returning_users {
    type: number
    sql: ${TABLE}.RETURNING_USERS ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.REVENUE ;;
  }

  dimension: revenue_budget {
    type: number
    sql: ${TABLE}.REVENUE_BUDGET ;;
  }

  dimension: revenue_per_paying_user {
    type: number
    sql: ${TABLE}.REVENUE_PER_PAYING_USER ;;
  }

  dimension: revenue_per_user {
    type: number
    sql: ${TABLE}.REVENUE_PER_USER ;;
  }

  dimension: revenue_per_user2 {
    type: number
    sql: ${TABLE}.REVENUE_PER_USER2 ;;
  }

  dimension: roi {
    type: number
    sql: ${TABLE}.ROI ;;
  }

  dimension: roi_percent {
    type: number
    sql: ${TABLE}.ROI_PERCENT ;;
  }

  dimension: roi_target {
    type: number
    sql: ${TABLE}.ROI_TARGET ;;
  }

  dimension: roi_target_percent {
    type: number
    sql: ${TABLE}.ROI_TARGET_PERCENT ;;
  }

  dimension: session_depth {
    type: number
    sql: ${TABLE}.SESSION_DEPTH ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.SESSIONS ;;
  }

  dimension: transactions {
    type: number
    sql: ${TABLE}.TRANSACTIONS ;;
  }
  dimension: target {
    type: number
    sql: 700000 ;;
    value_format: "0,\" K\""
  }
  dimension: target1 {
    type: number
    sql: 600 ;;
  }
  dimension: target2 {
    type: number
    sql: 70.00;;
    value_format:"0\%"
  }



  measure: count {
    type: count
    drill_fields: []
  }
  measure: Returning_Users_TM {
    type: sum
    sql: ${returning_users} ;;
    #value_format: "0.0,\" K\""
  }
  measure: Transactions_TM {
    type: sum
    sql:  ${TABLE}.TRANSACTIONS ;;
    value_format: "0.0,\" K\""
  }

  measure: Ltv_TM {
    type: average
    sql:  ${TABLE}.LTV ;;
    value_format: "$0"
  }

  measure: CPI_TM {
    type: average
    sql:  ${TABLE}.COST_PER_INSTALL ;;
    value_format: "$0"
  }

  measure: Conversion_Rate_TM {
    type: average
    sql:  ${TABLE}.CONVERSION_RATE ;;
    value_format:"0\%"
  }
  measure: ARPU_TM {
    type: sum
    sql: ${revenue_per_user} ;;
    value_format: "$0.0,\" K\""
    html:
    <p style="font-size:25px;">{{rendered_value}}</p>;;
  }

  measure: New_User_TM {
    type: sum
    sql: ${new_users} ;;
   # value_format: "$0.0,\" K\""
  }
  measure: Total_Installs_TM {
    type: number
    sql: ${New_User_TM}+(${New_User_TM}*1.5) ;;
    value_format: "$0.0,\" K\""
    html:
    <p style="font-size:25px;">{{rendered_value}}</p>;;
  }
  measure: Session_Count_TM {
    type: sum
    sql: ${sessions} ;;
    value_format: "$0.0,\" K\""
  }

  measure: MAU_TM {
    type: sum
    sql: ${mau} ;;
    value_format: "$0.0,\" K\""
  }
  measure: Retention_TM {
    type: average
    sql: ${retention_rate} ;;
    value_format: "0.0\%"
  }
  measure: Screens_Visit_TM {
    type: average
    sql: ${avg_screens_per_visit} ;;
    value_format: "0"
  }
  measure: AVG_Playtime_TM {
    type: average
    sql: ${avg_playtime} ;;
    value_format: "0"
  }
  measure: AOR_TM {
    type: average
    sql: ${avg_app_open_rate} ;;
    value_format: "0"
  }
  measure: Session_Depth_TM {
    type: average
    sql: ${session_depth} ;;
    value_format: "0"
  }

  measure: ARPPU_TM {
    type: sum
    sql: (${revenue_per_paying_user}*11.5) ;;
    value_format: "$0.0,\" K\""
  }
  measure: ROI_TM {
    type: average
    sql: ${roi_percent};;
    value_format: "0.0\%"
  }
  measure: Target2 {
    type: average
    sql: ${roi_target_percent};;
   value_format_name: percent_0
  }
    measure: DAU_MAU {
    type: average
    sql: (${dau}/${mau}) ;;
    value_format: "0.0%"
  }

  measure: UGR_TM {
    type: number
    sql: (${New_User_TM})/(${Returning_Users_TM}) ;;
    value_format: "0.0\%"
  }

  measure: PD_Conversion_Rate_TM {
    type: average
    sql: ${paid_conversion} ;;
    value_format: "0.0\%"
  }


  measure: Org_Conversion_Rate_TM {
    type: average
    sql: ${organic_conversion} ;;
    value_format: "0.0\%"
  }

  measure: Revenue_Target {
    type: number
    sql: 250000000;;

  }

  filter: month_filter {
    type: string
    #suggestions: ["01-02-2020"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]

  }

  measure: MAU_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${mau} end ;;
    value_format: "0.0,\" K\""
  }


  measure: MAU_LM_pr{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${mau} end ;;
  value_format: "0.0,\" K\""
  }

  measure: MAU_Growth{
    type: number
    sql: ((${MAU_selected_month}-${MAU_LM_pr})/nullif(${MAU_LM_pr},0)) ;;
   value_format: "0.0%"
  }


  measure: ARPU_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${ga_dim_date.date__month} {% endcondition %} then ${revenue_per_user} end ;;
    value_format: "$0.0,\" K\""
  }

  measure: ARPU_LM_pr {
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${ga_dim_date.date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${revenue_per_user} end ;;
    value_format: "$0.0,\" K\""
  }

  measure: ARPU_Growth{
    type: number
    sql: ((${ARPU_selected_month}-${ARPU_LM_pr})/nullif(${ARPU_LM_pr},0)) ;;
    value_format: "0.0%"
    html: {% if value >0 %}
    <p style="color: green; margin: 0;  text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: red;  margin: 0;  text-align:center">{{ rendered_value }}</p>
    {% endif %}
     ;;
    }

  measure: ARPPU_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then (${revenue_per_paying_user}*11.5) end ;;
    value_format: "$0.0,\" K\""
  }

  measure: ARPPU_LM_pr {
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN (${revenue_per_paying_user}*11.5) end ;;
    value_format: "$0.0,\" K\""
  }

  measure: ARPPU_Growth{
    type: number
    sql: ((${ARPPU_selected_month}-${ARPPU_LM_pr})/nullif(${ARPPU_LM_pr},0)) ;;
    value_format: "0.0%"
  }
  measure: Installs_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${new_users}+(${new_users} * 1.5) end ;;
    value_format: "0.0,\" K\""
  }
  measure: Installs_last_month {
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${new_users}+(${new_users} * 1.5) end ;;
    value_format:"0.0,\" K\""
  }
  measure: Installs_Growth{
    type: number
    sql: ((${Installs_selected_month}-${Installs_last_month})/${Installs_selected_month}) ;;
    value_format: "0.0%"
  }

  measure: ROI_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${roi_percent} end ;;
    value_format: "0.0\%"
  }

  measure: ROI_LM_pr {
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${roi_percent} end ;;
    value_format: "0.0\%"
  }

  measure: ROI_Growth{
    type: number
    sql: ((${ROI_selected_month}-${ROI_LM_pr})/${ROI_LM_pr}) ;;
    value_format: "0.0%"
  }

  measure: Transactions_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${TABLE}.TRANSACTIONS end ;;
    value_format: "0.0,\" K\""
  }

  measure: Transactions_LM_pr {
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${TABLE}.TRANSACTIONS end ;;
    value_format: "0.0,\" K\""
  }

  measure: Transactions_Growth{
    type: number
    sql: ((${Transactions_selected_month}-${Transactions_LM_pr})/nullif(${Transactions_LM_pr},0)) ;;
    value_format: "0.0%"
  }

  measure: LTV_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${TABLE}.LTV end ;;
    value_format: "$0"
  }

  measure: LTV_LM_pr {
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${TABLE}.LTV end ;;
    value_format: "$0"
  }

  measure: LTV_Growth{
    type: number
    sql: ((${LTV_selected_month}-${LTV_LM_pr})/${LTV_LM_pr}) ;;
    value_format: "0.0%"
  }

  measure: CPI_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${TABLE}.COST_PER_INSTALL end ;;
    value_format: "$0"
  }

  measure: CPI_LM_pr {
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${TABLE}.COST_PER_INSTALL end ;;
    value_format: "$0"
  }

  measure: CPI_Growth{
    type: number
    sql: ((${CPI_selected_month}-${CPI_LM_pr})/${CPI_LM_pr}) ;;
    value_format: "0.0%"
  }

  measure: Conversion_Rate_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${TABLE}.CONVERSION_RATE end ;;
    value_format: "0\%"
  }

  measure: Conversion_Rate_LM_pr {
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${TABLE}.CONVERSION_RATE end ;;
    value_format: "0\%"
  }

  measure: Conversion_Rate_Growth{
    type: number
    sql: ((${Conversion_Rate_selected_month}-${Conversion_Rate_LM_pr})/${Conversion_Rate_LM_pr}) ;;
    value_format: "0.0%"
  }

  measure: Retention_Rate_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${retention_rate} end ;;
    value_format: "0.0\%"
  }

  measure: Retention_Rate_LM_pr {
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${retention_rate} end ;;
    value_format: "0.0\%"
  }

  measure: Retention_Rate_Growth{
    type: number
    sql: ((${Retention_Rate_selected_month}-${Retention_Rate_LM_pr})/${Retention_Rate_LM_pr}) ;;
    value_format: "0.0%"
  }
  measure: NewUsers_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${new_users} end ;;
    value_format: "0.0,\" K\""
  }
  measure: NewUsers_LastMonth{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${new_users} end ;;
  value_format: "0.0,\" K\""
  }
  measure: NewUsers_Growth{
    type: number
    sql: ((${NewUsers_selected_month}-${NewUsers_LastMonth})/nullif(${NewUsers_LastMonth},0)) ;;
    value_format: "0.0%"
  }
  measure: ReturningUsers_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${returning_users} end ;;
    value_format: "0.0,\" K\""
  }
  measure: ReturningUsers_LastMonth{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${returning_users} end ;;
    value_format: "0.0,\" K\""
  }
  measure: ReturningUsers_Growth{
    type: number
    sql: ((${ReturningUsers_selected_month}-${ReturningUsers_LastMonth})/nullif(${ReturningUsers_LastMonth},0)) ;;
    value_format: "0.0%"
  }
  measure: SessionCount_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${sessions} end ;;
    value_format: "0.0,\" K\""
  }
  measure: SessionCount_LastMonth{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${sessions} end ;;
    value_format: "0.0,\" K\""
  }
  measure: SessionCount_Growth{
    type: number
    sql: ((${SessionCount_selected_month}-${SessionCount_LastMonth})/nullif(${SessionCount_LastMonth},0)) ;;
    value_format: "0.0%"
  }
  measure: SessionLength_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${avg_session_length_sec} end ;;
    value_format: "0"
  }
  measure: SessionLength_LastMonth{
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${avg_session_length_sec} end ;;
    value_format: "0"
  }
  measure: SessionLength_Growth{
    type: number
    sql: ((${SessionLength_selected_month}-${SessionLength_LastMonth})/${SessionLength_LastMonth}) ;;
    value_format: "0.0%"
  }
  measure: RetentionRate_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${retention_rate} end ;;
    value_format: "0.0\%"
  }
  measure: RetentionRate_LastMonth{
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${retention_rate} end ;;
   value_format: "0.0\%"
  }
  measure: RetentionRate_Growth{
    type: number
    sql: ((${RetentionRate_selected_month}-${RetentionRate_LastMonth})/${RetentionRate_LastMonth}) ;;
    value_format: "0.0%"
  }
  measure: ScreensVisits_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${avg_screens_per_visit} end ;;
    value_format: "0"
  }
  measure: ScreenVisits_LastMonth{
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${avg_screens_per_visit} end ;;
    value_format: "0"
  }
  measure: ScreenVisits_Growth{
    type: number
    sql: ((${ScreensVisits_selected_month}-${ScreenVisits_LastMonth})/${ScreenVisits_LastMonth}) ;;
    value_format: "0.0%"
  }
  measure: PlayTime_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${avg_playtime} end ;;
    value_format: "0"
  }
  measure: PlayTime_LastMonth{
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${avg_playtime} end ;;
    value_format: "0"
  }
  measure: PlayTime_Growth{
    type: number
    sql: ((${PlayTime_selected_month}-${PlayTime_LastMonth})/${PlayTime_LastMonth}) ;;
    value_format: "0.0%"
  }
  measure: AOR_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${avg_app_open_rate} end ;;
    value_format: "0"
  }
  measure:AOR_LastMonth{
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${avg_app_open_rate} end ;;
    value_format: "0"
  }
  measure: AOR_Growth{
    type: number
    sql: ((${AOR_selected_month}-${AOR_LastMonth})/${AOR_LastMonth}) ;;
    value_format: "0.0%"
  }
  measure: SessionDepth_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${session_depth} end ;;
    value_format: "0"
  }
  measure:SessionDepth_LastMonth{
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${session_depth} end ;;
    value_format: "0"
  }
  measure: SessionDepth_Growth{
    type: number
    sql: ((${SessionDepth_selected_month}-${SessionDepth_LastMonth})/${SessionDepth_LastMonth}) ;;
    value_format: "0.0%"
  }
  # measure: K_Factor_selected_month {
  #   type: average
  #   sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then (${NewUsers_selected_month})/(${ReturningUsers_LastMonth}) end ;;
  #   value_format: "0.0%"
  # }

  # measure:K_Factor_LastMonth{
  #   type: average
  #   sql: CASE WHEN {% condition month_filter %} To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
  #     {% endcondition %} THEN (${NewUsers_selected_month})/(${ReturningUsers_LastMonth}) end ;;
  #   value_format: "0.0%"
  # }
  # measure: K_Factor_Growth{
  #   type: number
  #   sql: ((${K_Factor_selected_month}-${K_Factor_LastMonth})/${K_Factor_LastMonth}) ;;
  #   value_format: "0.0%"
  # }
  measure: NewUsers_selected_month1 {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %}
    then ${new_users} end ;;
    value_format_name: percent_1
  }
  measure: NewUsers_LastMonth1{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),2),'yyyy-mm')
      {% endcondition %} THEN ${new_users} end ;;
     value_format_name: percent_1
  }
  measure: ReturningUsers_selected_month1 {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${returning_users} end ;;
   value_format_name: percent_1
  }
  measure: ReturningUsers_LastMonth1{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),2),'yyyy-mm')
      {% endcondition %} THEN ${returning_users} end ;;
     value_format_name: percent_1
  }
  measure: ReturningUsers_LastMonth2{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${returning_users} end ;;
    value_format_name: percent_1
  }
  measure: UGR_Selected_Month {
    type: number
    sql: (${NewUsers_selected_month1}/${ReturningUsers_selected_month1}) ;;
    value_format_name: percent_1
  }
  measure: UGR_LastMonth {
    type: number
    sql: (${NewUsers_LastMonth1}/nullif(${ReturningUsers_LastMonth1},0)) ;;
    value_format_name: percent_1
  }
  measure: UGR_Growth{
    type: number
    sql: ((${UGR_Selected_Month}-${UGR_LastMonth})/nullif(${UGR_LastMonth},0)) ;;
    value_format_name: percent_1
  }

  measure: ReturningUsers_LastMonth12{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),2),'yyyy-mm')
      {% endcondition %} THEN ${returning_users} end ;;
    value_format_name: percent_1
  }
  measure: NewUsers_LastMonth01{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${new_users} end ;;
    value_format_name: percent_1
  }

  measure: K_Factor_SelectedMonth {
    type: number
    sql: case when ${ReturningUsers_LastMonth2}=0 then 0 else (${NewUsers_selected_month1}/${ReturningUsers_LastMonth2})end ;;
    value_format_name: percent_1
  }

  measure: K_Factor_LastMonth {
    type: number
    sql: case when ${ReturningUsers_LastMonth12}=0 then 0 else ${NewUsers_LastMonth01}/nullif(${ReturningUsers_LastMonth12},0) end;;
    value_format_name: percent_1
  }
  measure: K_Factor_Growth{
    type: number
    sql: ((${K_Factor_SelectedMonth}-${K_Factor_LastMonth})/nullif(${K_Factor_LastMonth},0)) ;;
    value_format_name: percent_1
  }


  dimension: Start_Date1 {
    type: string
    sql: '2020-01-01' ;;
  }

  dimension: End_Date1 {
    type: string
    sql: case when {% condition month_filter %} to_date(${date__date},'yyyy-mm-dd') {% endcondition %} then ${date__date} end ;;
  }

  measure: Last12month {
    type: average
    sql:case when to_date(${date__date},'yyyy-mm-dd')>= to_date(${Start_Date},'yyyy-mm-dd') and to_date(${date__date},'yyyy-mm-dd')<= to_date( ${End_Date},'yyyy-mm-dd') then ${avg_session_length_sec} end  ;;
    value_format: "0.0"
  }


  measure:Overview_Finance_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 5px;" >
      <tr>
      <td style="text-align:center;width:200px;">
      <p >{{finance_revenue_stack_derived.Revenue_selected_month._rendered_value}}
      </p>
      </td>
      <td style="text-align:center;width:200px;">
      <p >{{ga_finance.ARPU_selected_month._rendered_value}}
      </p>
      </td>
     </tr>

      <tr>
      <td style="text-align:center; width:200px;">
      <p>{{finance_revenue_stack_derived.Revenue_Growth._rendered_value}}
      </p>
      </td>
      <td style="text-align:center; width:200px;">
      <p>{{ga_finance.ARPU_Growth._rendered_value}}
      </p>
      </td>
      </tr>
      </table>



      </body>
      </html>
      ;;
  }

  measure:Overview_User_Engagement_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 5px;" >
      <tr>
      <td style="text-align:center;width:200px;">
      <p >{{ga_finance.Installs_selected_month._rendered_value}}
      </p>
      </td>
      <td style="text-align:center;width:200px;">
      <p >{{ga_churn_rate_causes.Uninstalls_selected_month._rendered_value}}
      </p>
      </td>
     </tr>

      <tr>
      <td style="text-align:center; width:200px;">
      <p>{{ga_finance.Installs_Growth._rendered_value}}
      </p>
      </td>
      <td style="text-align:center; width:200px;">
      <p>{{ga_churn_rate_causes.Uninstalls_Growth._rendered_value}}
      </p>
      </td>
      </tr>
      </table>



      </body>
      </html>
      ;;
  }

  measure:Overview_UserEngagement_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 5px;" >
      <tr>
      <td style="text-align:center;width:200px;">
      <p >{{ga_finance.Installs_selected_month._value}}
      </p>
      </td>
      <td style="text-align:center;width:200px;">
      <p >{{ga_churn_rate_causes.Uninstalls_selected_month._rendered_value}}
      </p>
      </td>
     </tr>

      <tr>
      <td style="text-align:center; width:200px;">
      <p>{{ga_finance.Installs_Growth._rendered_value}}
      </p>
      </td>
      <td style="text-align:center; width:200px;">
      <p>{{ga_churn_rate_causes.Uninstalls_Growth._rendered_value}}
      </p>
      </td>
      </tr>
      </table>



      </body>
      </html>
      ;;
  }



  measure:Finance_MAU_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height:1.5;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:left;width:200px;padding-top:10px;font-size:13px;padding-left:10px;">
      MAU<br style="line-height:1.5"><b style="font-size:29.5px; ">{{ga_finance.MAU_selected_month._rendered_value}}</b>

      </td>
      <td style="text-align:center;width:200px;padding-top: 35px;font-size:13px;padding-left:55px;">
      DAU / MAU<br style="line-height:1.5;"><b style="font-size:15px;">
      {{ ga_finance.DAU_MAU._rendered_value }}
      </b>
      </td>
     </tr>

      <tr>
      <td style="text-align:left; line-height:1.5;width:200px;font-size:13px;Padding-left:10px;">

      {% if ga_finance.MAU_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.MAU_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.MAU_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>



      </tr>
      </table>

      </body>
      </html>
      ;;
  }


  measure:Finance_ARPU_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:15px;padding-left: 30px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:left;width:200px;padding-left:15Px;padding-top: 15px;font-size:13px;padding-left:10px;">
      ARPU<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.ARPU_selected_month._rendered_value}}</b>

      </td>
      <td style="text-align:left;width:200px;padding-top: 15px;padding-right:15px;font-size:13px;padding-left:60px;">
      ARPPU<br style="line-height:1.5;"><b style="font-size:29.5px;">{{ga_finance.ARPPU_selected_month._rendered_value}}</b>

      </td>
    </tr>

      <tr">
      <td style="text-align:left; line-height:1.5;width:200px;font-size:13px;padding-left: 10px;">
      <p>
      {% if ga_finance.ARPU_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.ARPU_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.ARPU_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>
      </td>

      <td style="text-align:left; line-height:1.5;width:200px;font-size:13px;padding-left:60px;">
      <p>
      {% if ga_finance.ARPPU_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.ARPPU_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red">▼  {{ ga_finance.ARPPU_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>
      </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  measure:Finance_ROI_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:left;width:200px;padding-top: 15px;font-size:13px;padding-left:10px;">
      ROI<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.ROI_selected_month._rendered_value}}</b>

      </td>
      <td style="text-align:center;width:200px;padding-top: 35px;font-size:14px;padding-left:55px;">
      <p >Target<br style="line-height:1.5;"><b style="font-size:15px;">
      {{ ga_finance.Target2._rendered_value }}</b>
      </p>
      </td>
     </tr>

      <tr>
      <td style="text-align:left; line-height:1.5;width:200px;font-size:13px;Padding-left:10px;">

      {% if ga_finance.ROI_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.ROI_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.ROI_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }


  measure:Finance_Transactions_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;Padding-left:15px;font-size:13px;">
      <p> TRANSACTIONS<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.Transactions_selected_month._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:center;width:200px;padding-top: 15px;padding-left:15px;font-size:13px;">
      <br>
      <p>
      {% if ga_finance.Transactions_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.Transactions_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.Transactions_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>


      </td>
     </tr>


      </table>

      </body>
      </html>
      ;;
  }

  measure:Finance_LTV_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top:15px;font-size:13px;padding-left:15px;">
      <p >LONG&nbsp;TIME&nbsp;VALUE<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.LTV_selected_month._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:center;width:200px;padding-top:30px;padding-left:15px;font-size:13px;">
      <p>
      {% if ga_finance.LTV_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.LTV_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.LTV_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>

      </p>
      </td>
     </tr>


      </table>

      </body>
      </html>
      ;;
  }

  measure:Finance_CPI_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:left;width:200px;padding-top:15px;font-size:13px;padding-left:15px;">
      <p >COST / INSTALL<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.CPI_selected_month._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:center;width:200px;padding-top:35px;padding-left:15px;font-size:13px;">
      <p>
      {% if ga_finance.CPI_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.CPI_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.CPI_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>

      </p>
      </td>
     </tr>


      </table>

      </body>
      </html>
      ;;
  }


  measure:Finance_Conversion_Rate_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;padding-left:15px;">
      <p >CONVERSION &nbsp;RATE<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.Conversion_Rate_selected_month._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:center;width:200px;padding-top:30px;padding-left:15px;font-size:13px;">
      <p>
      {% if ga_finance.Conversion_Rate_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.Conversion_Rate_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.Conversion_Rate_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>

      </p>
      </td>
     </tr>


      </table>

      </body>
      </html>
      ;;
  }


  measure:User_Engagement_MAU_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 10px;font-size:13px;padding-left:10px;">
      MAU-NEW<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.NewUsers_selected_month._rendered_value}}</b>
      </td>
      <td style="text-align:LEFT;width:200px;padding-top: 10px;font-size:13px;padding-left:40px;">
      MAU-RETURNING<br style="line-height:1.5;"><b style="font-size:29.5px;">{{ga_finance.ReturningUsers_selected_month._rendered_value}}</b>
      </td>
    </tr>

      <tr>
      <td style="text-align:LEFT; line-height:1.5;width:200px;font-size:13px;padding-left:10px;">

      {% if ga_finance.NewUsers_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.NewUsers_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.NewUsers_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>

      <td style="text-align:LEFT; line-height:1.5;width:200px;font-size:13px;padding-left:40px;">

      {% if ga_finance.ARPU_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.ReturningUsers_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.ReturningUsers_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  measure:User_Engagement_SessionCount_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >

      <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 10px;font-size:13px;padding-left:10px;">
      SESSION&nbsp;COUNT<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.SessionCount_selected_month._rendered_value}}</b>
      </td>
      <td style="text-align:center;width:200px;padding-top: 35px;font-size:14px;padding-left:55px;">
      Target<br style="line-height:1.5;"><b style="font-size:15px;">
       {{ga_finance.target._rendered_value}}</b>
      </td>
      </tr>

      <tr>
      <td style="text-align:LEFT; line-height:1.5;width:200px;font-size:13px;padding-left:10px;">

      {% if ga_finance.SessionCount_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.SessionCount_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.SessionCount_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }


  measure:User_Engagement_AVGSessionLen_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 10px;font-size:13px;padding-left:10px;">
      AVG.&nbsp;SESSION&nbsp;LENGTH<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.SessionLength_selected_month._rendered_value}}</b>&nbsp;sec
      </td>
      <td style="text-align:center;width:200px;padding-top: 35px;font-size:14px;padding-left:55px;">
      Target<br style="line-height:1.5;"><b style="font-size:15px;">
      {{ga_finance.target1._rendered_value}}
      </b>
      </td>
    </tr>

      <tr>
      <td style="text-align:LEFT; line-height:1.5;width:200px;font-size:13px;padding-left:10px;">

      {% if ga_finance.SessionLength_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.SessionLength_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.SessionLength_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>

      </tr>
      </table>

      </body>
      </html>
      ;;
  }


  measure:User_Engagement_RetentionRate_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height:1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 10px;font-size:13px;padding-left:10px;">
      RETENTION&nbsp;RATE<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.Retention_Rate_selected_month._rendered_value}}</b>
      </td>
      <td style="text-align:center;width:200px;padding-top: 35px;font-size:14px;padding-left:55px;">
      Target<br style="line-height:1.5;"><b style="font-size:15px;">
      {{ga_finance.target2._rendered_value}}
      </b>
      </td>
    </tr>

      <tr>
      <td style="text-align:LEFT; line-height:1.0;width:200px;font-size:13px;padding-left:10px;">

      {% if ga_finance.Retention_Rate_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.Retention_Rate_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.Retention_Rate_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </td>

      </tr>
      </table>

      </body>
      </html>
      ;;
  }


  measure:User_Engagement_AvgScreens_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;padding-left:4px;">
      <p >AVG.&nbsp;SCREENS / VISIT<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.ScreensVisits_selected_month._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:center;width:200px;padding-top: 25px;font-size:13px;padding-left:40px;">
      <p>
      {% if ga_finance.ScreenVisits_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.ScreenVisits_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.ScreenVisits_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>

      </p>
      </td>
      </tr>


      </table>

      </body>
      </html>
      ;;
  }


  measure:User_Engagement_AvgAppOpenRate_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;padding-left:5px;">
      <p >AVG.&nbsp;APP&nbsp;OPEN&nbsp;RATE<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.AOR_selected_month._rendered_value}}</b>&nbsp;/Day
      </p>
      </td>
      <td style="text-align:center;width:200px;padding-top: 25px;font-size:13px;padding-left:35px;">
      <p>
      {% if ga_finance.AOR_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.AOR_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.AOR_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>

      </p>
      </td>
      </tr>


      </table>

      </body>
      </html>
      ;;
  }


  measure:User_Engagement_AvgPlayTime_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;padding-left:4px;">
      <p >AVG.&nbsp;PLAYTIME<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.PlayTime_selected_month._rendered_value}}</b>&nbsp;sec
      </p>
      </td>
      <td style="text-align:center;width:200px;padding-top: 25px;font-size:13px;padding-left:55px;">
      <p>
      {% if ga_finance.PlayTime_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.PlayTime_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.PlayTime_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>

      </p>
      </td>
      </tr>


      </table>

      </body>
      </html>
      ;;
  }

  measure:User_Engagement_AvgSessionDepth_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;padding-left:4px;">
      <p >AVG.&nbsp;SESSION&nbsp;DEPTH<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.SessionDepth_selected_month._rendered_value}}</b>&nbsp;Levels
      </p>
      </td>
      <td style="text-align:center;width:200px;padding-top: 25px;font-size:13px;padding-left:40px;">
      <p>
      {% if ga_finance.SessionDepth_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.SessionDepth_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.SessionDepth_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>

      </p>
      </td>
      </tr>


      </table>

      </body>
      </html>
      ;;
  }


  measure:Marketing_ConversionRate_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height:1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:LEFT;width:200px;font-size:13px;padding-top:10px;padding-left:10px;">
      CONVERSION&nbsp;RATE<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.Conversion_Rate_selected_month._rendered_value}}</b>

      </td>
      <td style="text-align:center;width:200px;padding-top: 35px;font-size:14px;padding-left:55px;">
      Target<br style="line-height:1.5;"><b style="font-size:15px;">
      {{marketing_br_adv_derived.Conversion_Rate_Target._rendered_value}}
      </b>
      </td>
    </tr>

      <tr>
      <td style="text-align:LEFT; line-height:1.5;width:200px;font-size:13px;padding-left:10px;">

      {% if ga_finance.Conversion_Rate_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.Conversion_Rate_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.Conversion_Rate_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  measure:Marketing_RetentionRate_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height:1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:LEFT;width:200px;padding-top:10px;font-size:13px;padding-left:10px;">
      RETENTION&nbsp;RATE<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.Retention_Rate_selected_month._rendered_value}}</b>

      </td>
      <td style="text-align:center;width:200px;padding-top:35px;font-size:14px;padding-left:55px;">
     Target<br style="line-height:2.0;"><b style="font-size:15px;">
      {{marketing_br_adv_derived.Retention_Rate_Target._rendered_value}}
      </b>
      </td>
    </tr>

      <tr>
      <td style="text-align:LEFT; line-height:1.0;width:200px;font-size:13px;padding-left:10px;">

      {% if ga_finance.Retention_Rate_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.Retention_Rate_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.Retention_Rate_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  measure:Marketing_KFactor_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:LEFT;width:200px;padding-top:10px;font-size:13px;padding-left:10px;">
       K&nbsp;FACTOR<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.K_Factor_SelectedMonth._rendered_value}}</b>

      </td>
      <td style="text-align:center;width:200px;padding-top: 35px;font-size:14px;padding-left:55px;">
     Target<br style="line-height:1.5;"><b style="font-size:15px;">
      {{marketing_br_adv_derived.K_Factor_Target._rendered_value}}
    </b>
      </td>
    </tr>

      <tr>
      <td style="text-align:LEFT; line-height:1.5;width:200px;font-size:13px;padding-left:10px;">

      {% if ga_finance.K_Factor_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.K_Factor_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.K_Factor_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }


  measure:Marketing_VTI_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;padding-left:5px;">
      <p >VIEWS&nbsp;T0&nbsp;INSTALL<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_marketing.VTI_selected_month._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:center; line-height:1.0;width:200px;font-size:13px;padding-left:10px;padding-top:30px;">
      <p>
      {% if ga_marketing.VTI_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_marketing.VTI_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_marketing.VTI_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>
      </td>
    </tr>
      </table>
      </body>
      </html>
      ;;
  }

  measure:Marketing_UGR_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;padding-left:5px;">
      <p >USER&nbsp;GROWTH&nbsp;RATE<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.UGR_Selected_Month._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:center; line-height:1.0;width:200px;font-size:13px;padding-left:10px;padding-top:30px;">
      <p>
      {% if ga_finance.UGR_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.UGR_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.UGR_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>
      </td>

    </tr>


      </table>

      </body>
      </html>
      ;;
  }


  measure:Marketing_ConversionRateBreakdown_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;padding-left:5px;">
      <p >CONVERSION&nbsp;RATE&nbsp;BREAKDOWN<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.PD_Conversion_Rate_TM._rendered_value}}</b><br> Paid
      </p>
      </td>
      <td style="text-align:left;width:200px;padding-top: 15px;font-size:14px;padding-left:15px;">
      <p ><br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.Org_Conversion_Rate_TM._rendered_value}}</b><br> Organic
      </p>
      </td>

      </tr>


      </table>

      </body>
      </html>
      ;;
  }


  measure:Marketing_AppRanking_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:LEFT;width:200px;padding-top:15px;font-size:13px;padding-left:5px;">
      <p >APP.&nbsp;RANKING<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{marketing_br_adv_derived.AppStore_Ranking_TM._rendered_value}}</b>/5<br> App&nbsp;Store
      </p>
      </td>
      <td style="text-align:left;width:200px;padding-top:15px;font-size:14px;padding-left:11px;">
      <p ><br style="line-height:1.5;"><b style="font-size:29.5px; ">{{marketing_br_adv_derived.MicrosoftStore_Ranking_TM._rendered_value}}</b>/5<br> Play&nbsp;Store
      </p>
      </td>
      <td style="text-left:left;width:200px;padding-top:15px;font-size:14px;padding-left:16px;">
      <p ><br style="line-height:1.5;"><b style="font-size:29.5px; ">{{marketing_br_adv_derived.PlayStore_Ranking_TM._rendered_value}}</b>/5<br> Microsoft&nbsp;Store
      </p>
      </td>
      </tr>


      </table>

      </body>
      </html>
      ;;
  }



measure:Overview_Revenue_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height:1.5;align:center;font-size:15px;padding-left: 15px;padding-top: 15px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:center;width:200px;padding-top: 15px;font-size:13px;">
      REVENUE<br style="line-height:1.5"><b style="font-size:29.5px; ">{{finance_revenue_stack_derived.Revenue_selected_month._rendered_value}}</b>
      </td>
      </tr>
      <tr style="line-height:1.0;">
      <td style="text-align:center;width:200px;padding-bottom:15px;font-size:13px;">

      {% if finance_revenue_stack_derived.Revenue_Growth._value >= 0 %}

      <font color="green"> ▲ {{ finance_revenue_stack_derived.Revenue_Growth._rendered_value }}</font>&ensp;LM

      {% else %}

      <font color="red"> ▼  {{ finance_revenue_stack_derived.Revenue_Growth._rendered_value }}</font>&ensp;LM

      {% endif %}




      </td>
      </tr>


      </table>

      </body>
      </html>
      ;;
  }

  measure:Overview_AVGRevenuePerUSER_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:center;width:200px;padding-top: 15px;font-size:12.5px;">
      AVG.&nbsp;REVENUE&nbsp;/&nbsp;USER<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.ARPU_selected_month._rendered_value}}</b>

      </td>
      </tr>
      <tr>
      <td style="text-align:center;width:200px;padding-bottom: 13px;font-size:13px;">

      {% if ga_finance.ARPU_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.ARPU_Growth._rendered_value }}</font>&ensp;LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.ARPU_Growth._rendered_value }}</font>&ensp;LM

      {% endif %}




      </td>
      </tr>


      </table>

      </body>
      </html>
      ;;
  }


  measure:Overview_Installs_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:center;width:200px;padding-top: 15px;font-size:13px;">
     INSTALLS<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_finance.Installs_selected_month._rendered_value}}</b>

      </td>
      </tr>
      <tr>
      <td style="text-align:center;width:200px;padding-bottom: 15px;font-size:13px;">

      {% if ga_finance.Installs_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_finance.Installs_Growth._rendered_value }}</font>&ensp;LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.Installs_Growth._rendered_value }}</font>&ensp;LM

      {% endif %}


      </td>
      </tr>


      </table>

      </body>
      </html>
      ;;
  }

  measure:Overview_Uninstalls_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:center;width:200px;padding-top: 15px;font-size:13px;">
      UNINSTALLS<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{ga_churn_rate_causes.Uninstalls_selected_month._rendered_value}}</b>

      </td>
      </tr>
      <tr>
      <td style="text-align:center;width:200px;padding-bottom: 15px;font-size:13px;">

      {% if ga_churn_rate_causes.Uninstalls_Growth._value >= 0 %}

      <font color="green"> ▲ {{ ga_churn_rate_causes.Uninstalls_Growth._rendered_value }}</font>&ensp;LM

      {% else %}

      <font color="red"> ▼  {{ ga_finance.Installs_Growth._rendered_value }}</font>&ensp;LM

      {% endif %}


      </td>
      </tr>


      </table>

      </body>
      </html>
      ;;
  }


  dimension: finance_revenue_header {
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 15pt; margin:10px auto;text-align:left;border-radius: 10px;">Revenue &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: finance_quick_stats_header {
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 15pt; margin:10px auto;text-align:left;border-radius: 10px;">Quick Stats &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: finance_revenue_stack_header {
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 15pt; margin:10px auto;text-align:left;border-radius: 10px;">Revenue Stack &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: finance_details_header_finance {
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 15pt; margin:10px auto;text-align:left;border-radius: 10px;">Finance Details &nbsp;
      </h1>
      </html>
      ;;
  }



  }
