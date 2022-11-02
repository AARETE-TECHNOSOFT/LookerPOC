# The name of this view in Looker is "Hra Month No"
view: hra_month_no {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".HRA_MONTH_NO
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Month" in Explore.

  dimension: month {
    type: string
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: month_no {
    type: number
    sql: ${TABLE}.MONTH_NO ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_month_no {
    type: sum
    sql: ${month_no} ;;
  }

  measure: average_month_no {
    type: average
    sql: ${month_no} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
