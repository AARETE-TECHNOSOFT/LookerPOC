# The name of this view in Looker is "Dimdate Fd"
view: dimdate_fd {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".DIMDATE_FD
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Date " in Explore.

  dimension: date_ {
    primary_key: yes
    type: date
    sql: ${TABLE}.DATE_ ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: month_year {
    type: string
    sql: ${TABLE}.MONTH_YEAR ;;
  }

  dimension: monthofyear {
    type: string
    sql: ${TABLE}.MONTHOFYEAR ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}."YEAR" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
