# The name of this view in Looker is "Cost Indicator Fd"

view: cost_indicator_fd {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".COST_INDICATOR_FD
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
    value_format: "0.00%"
    filters: [indicator: "Fidelis Overall NR %"]
    html:
    <p style="font-size:23px;">{{rendered_value}}</p>

    ;;
  }

  measure: total_data_Cost {
    type: sum
    sql: ${data} ;;
    filters: [indicator: "Cost Report Other Medicaid Providers Net Revenue %"]
    value_format: "0.00%"
    html:
    <p style="font-size:23px;">{{rendered_value}}</p>

    ;;
  }
  measure: average_data {
    type: average
    sql: ${data} ;;
  }

  dimension: datecol {
    type: string
    sql: ${TABLE}.DATECOL ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: datecolumn {
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
    sql: ${TABLE}.DATECOLUMN ;;
  }

  dimension: geography {
    type: string
    sql: ${TABLE}.GEOGRAPHY ;;
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
