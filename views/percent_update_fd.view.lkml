# The name of this view in Looker is "Percent Update Fd"
view: percent_update_fd {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".PERCENT_UPDATE_FD
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

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_data_ {
    type: sum
    sql: ${data_} ;;
  }

  measure: average_data_ {
    type: average
    sql: ${data_} ;;
  }

  dimension: data_update {
    type: string
    sql: ${TABLE}.DATA_UPDATE ;;
  }

  dimension: data_update1 {
    type: string
    sql: ${TABLE}.DATA_UPDATE1 ;;
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
  measure: Total_DATA {
    type: sum
    sql: ${data_} ;;
    value_format: "0.00%"
    html:
    <p style="font-size:20px;font-weight: bold;"><img src="https://img.icons8.com/ios/50/000000/box--v1.png" width="30" height="30"/> {{rendered_value}}</p>
    ;;
  }
}
