# The name of this view in Looker is "Mlc Fd"

view: mlc_fd {

  sql_table_name: "C##LOOKER".MLC_FD
    ;;


  dimension: column1 {
    type: string
    sql: ${TABLE}.COLUMN1 ;;
  }

  dimension: Medicaid {
    type: string
    sql: ${TABLE}.COLUMN2 ;;
  }

  dimension: rates {
    type: number
    sql: ${TABLE}.RATES ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_rates {
    type: sum
    sql: ${rates} ;;
    value_format: "0.00%"


  }

  measure: average_rates {
    type: average
    sql: ${rates} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

}
