# The name of this view in Looker is "Ga Finance Revenue Stack"
view: ga_finance_revenue_stack {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".GA_FINANCE_REVENUE_STACK
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Country" in Explore.

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

  dimension: game {
    type: string
    sql: ${TABLE}.GAME ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.PLATFORM ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.REVENUE ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
  }

  measure: average_revenue {
    type: average
    sql: ${revenue} ;;
  }

  dimension: revenue_actual {
    type: number
    sql: ${TABLE}.REVENUE_ACTUAL ;;
  }

  dimension: revenue_stack {
    type: string
    sql: ${TABLE}.REVENUE_STACK ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
