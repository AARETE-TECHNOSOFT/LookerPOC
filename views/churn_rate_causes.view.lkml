# The name of this view in Looker is "Churn Rate Causes"
view: churn_rate_causes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".CHURN_RATE_CAUSES
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Churn Numbers" in Explore.

  dimension: churn_numbers {
    type: number
    sql: ${TABLE}.CHURN_NUMBERS ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_churn_numbers {
    type: sum
    sql: ${churn_numbers} ;;
  }

  measure: average_churn_numbers {
    type: average
    sql: ${churn_numbers} ;;
  }

  dimension: churn_rate_causes {
    type: string
    sql: ${TABLE}.CHURN_RATE_CAUSES ;;
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

  dimension: game {
    type: string
    sql: ${TABLE}.GAME ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.PLATFORM ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
