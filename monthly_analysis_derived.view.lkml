view: monthly_analysis_derived {
  derived_table: {
    sql: select type,HR_DATES.DATEVALUE,sum(number_of_open_positions) from HR_MONTHLY_ANALYSIS inner join HR_DATES
              on (HR_MONTHLY_ANALYSIS.DATE_=HR_DATES.DATEVALUE)
              group by DATEVALUE,type
               ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: type {
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  dimension: datevalue {
    type: date
    sql: ${TABLE}.DATEVALUE ;;
  }

  dimension: sumnumber_of_open_positions {
    type: number
    sql: ${TABLE}."SUM(NUMBER_OF_OPEN_POSITIONS)" ;;
  }

  set: detail {
    fields: [type, datevalue, sumnumber_of_open_positions]
  }
}
