view: dimdate_fid {

  sql_table_name: "C##LOOKER".DIMDATE_FID
    ;;

  dimension: date_ {
    primary_key: yes
    type: string
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

  dimension_group: new {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    #convert_tz: no
    datatype: date
    sql: ${TABLE}.NEW_DATE ;;
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
