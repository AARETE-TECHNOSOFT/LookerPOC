# The name of this view in Looker is "Ms Fd"

view: ms_fd {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".MS_FD
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Data" in Explore.

  dimension: data {
    type: number
    sql: ${TABLE}.DATA ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_data {
    type: sum
    sql: ${data} ;;
  }

  measure: average_data {
    type: average
    sql: ${data} ;;
  }

  dimension: data_up {
    type: string
    sql: ${TABLE}.DATA_UP ;;
  }

  dimension: indicator {
    type: string
    sql: ${TABLE}.INDICATOR ;;
  }

  dimension: section {
    type: string
    sql: ${TABLE}.SECTION ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
