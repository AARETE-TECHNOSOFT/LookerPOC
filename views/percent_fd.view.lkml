# The name of this view in Looker is "Percent Fd"

view: percent_fd {

  sql_table_name: "C##LOOKER".PERCENT_FD
    ;;

  dimension: data_ {
    type: number
    sql: ${TABLE}.DATA_ ;;
    value_format: "0%"
  }
  dimension: Data_Percent {
    type: number
    sql: ${TABLE}.data_ ;;
    value_format: "00%"
  }
  measure: sum_Data_ {
    type: sum
    sql: ${TABLE}.data_ ;;
    value_format: "0%"
    html:
    <p style="font-size:23px;">{{rendered_value}}</p>
    ;;
  }
  measure: sum_Data_K {
    type: sum
    sql: ${TABLE}.data_ ;;
    value_format: "$0.0000,\" K\""
    html:
    <p style="font-size:20px;font-weight: bold;"><img src="https://img.icons8.com/material-rounded/24/000000/graph.png" width="30" height="30"/> {{rendered_value}}</p>
    ;;
  }
  measure: total_data_ {
    type: sum
    sql: ${data_} ;;
    value_format: "0.00%"
    html:
    <p style="font-size:23px;">{{rendered_value}}</p>
    ;;
  }
  measure: average_data_ {
    type: average
    sql: ${data_} ;;
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

  dimension: data_update {
    type: string
    sql: ${TABLE}.DATA_UPDATE ;;
  }


}
