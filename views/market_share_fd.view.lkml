# The name of this view in Looker is "Market Share Fd"

view: market_share_fd {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".MARKET_SHARE_FD
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Data" in Explore.

  dimension: data {
    type: string
    sql: ${TABLE}.DATA ;;
    html:
        <p style="font-size:23px;font-weight: bold;"> {{rendered_value}}</p>

    ;;
  }

  dimension: indicator {
    type: string
    sql: ${TABLE}.INDICATOR ;;
    html:
    <p style="font-size:20px;font-weight: bold;"> {{rendered_value}}</p>
    ;;
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
