# The name of this view in Looker is "Spend Breakout Fd"

view: spend_breakout_fd {

  sql_table_name: "C##LOOKER".SPEND_BREAKOUT_FD
    ;;

  dimension: data_ {
    type: number
    sql: ${TABLE}.DATA_ ;;
  }
  # dimension_group: current_time {

  #   type: time

  #   timeframes: [time, hour, hour_of_day, day_of_week, day_of_year, date, week, month, month_num, month_name, quarter, day_of_month, year, raw, week_of_year]

  #   sql: CURRENT_TIMESTAMP::TIMESTAMP ;;

  # }

  dimension_group: sys_Date {
    type: time
    timeframes: [date,week,month,year]
    sql: sysdate ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_data_ {
    type: sum
    sql: ${data_} ;;

    value_format: "$0"
    html:
    <p style="font-size:20px;font-weight: bold;"><img src="https://img.icons8.com/material-rounded/24/000000/graph.png" width="30" height="30"/> {{rendered_value}}</p>
    ;;
  }

  measure: average_data_ {
    type: average
    sql: ${data_} ;;
  }

  dimension: data_in_k {
    type: number
    sql: ${TABLE}.DATA_IN_K ;;
  }
  measure: Sum_Data {
    type: sum
    sql: ${TABLE}.data_in_k;;
    value_format:"$0,\" K\""

  }
  dimension: indicator_ {
    type: string
    sql: ${TABLE}.INDICATOR_ ;;
  }

  dimension: section_ {
    type: string
    sql: ${TABLE}.SECTION_ ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
