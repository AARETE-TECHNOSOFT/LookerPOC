# The name of this view in Looker is "Spend In Previous Years Fd"

view: spend_in_previous_years_fd {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".SPEND_IN_PREVIOUS_YEARS_FD
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Data " in Explore.

  dimension: data_ {
    type: number
    sql: ${TABLE}.DATA_ ;;
  }

  measure: sum_Data_K {
    type: sum
    sql: ${TABLE}.data_ ;;
    # value_format: "$0.0000,\" K\""
    value_format: "$0"
    html:
    <p style="font-size:20px;font-weight: bold;"><img src="https://img.icons8.com/ios/50/000000/tear-off-calendar--v1.png" width="30" height="30"/> {{rendered_value}}</p>
    ;;
  }
  measure: total_data_ {
    type: sum
    sql: ${data_} ;;
  }

  measure: average_data_ {
    type: average
    sql: ${data_} ;;
  }

  dimension: data_in_k {
    type: number
    sql: ${TABLE}.DATA_IN_K ;;
  }

  dimension: indicator_ {
    type: string
    sql: ${TABLE}.INDICATOR_ ;;
  }

  dimension: section_ {
    type: string
    sql: ${TABLE}.SECTION_ ;;
  }
  dimension: current_year {
    sql: 1 ;;
    html:
    <h1 style="color:black;background-color:#f4f4f4;font-size: 16pt; font-family: 'Georgia';margin:10px auto;text-align:LEFT; padding-top: 20px;padding-bottom: 20px;">Current Year 2020</h1>
    ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
}
