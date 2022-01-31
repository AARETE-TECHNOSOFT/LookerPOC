# The name of this view in Looker is "Quality Indicator Fd"

view: quality_indicator_fd {

  sql_table_name: "C##LOOKER".QUALITY_INDICATOR_FD
    ;;

  dimension: data {
    type: number
    sql: ${TABLE}.DATA ;;
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
  measure: total_data {
    type: sum
    sql: ${data} ;;
    html:
    <p style="font-size:20px;font-weight: bold;"><img src="https://img.icons8.com/ios/50/000000/star--v1.png"width="30" height="30"/>{{rendered_value}} </p>
    ;;
  }

  measure: average_data {
    type: average
    sql: ${data} ;;
  }
}
