view: daily_history {
  derived_table: {
    sql: SELECT D.*,
                  SUM(REVENUE) OVER(PARTITION BY BRAND,YEAR ORDER BY DAY1 ROWS UNBOUNDED PRECEDING)        AS YTD_REVENUE
           FROM (
           SELECT   PERFORMANCE_REPORTING.productclass                                                                   AS BRAND,
                    EXTRACT(YEAR FROM PERFORMANCE_REPORTING.BUSINESSWONDATE)                                             AS YEAR,
                    TO_DATE(PERFORMANCE_REPORTING.BUSINESSWONDATE)                                                       AS DAY1,
                    SUM(ACTUALTOTALUSD)                                                                       AS REVENUE
           FROM     C##LOOKER.PERFORMANCE_REPORTING
           GROUP BY productclass,EXTRACT(YEAR FROM PERFORMANCE_REPORTING.BUSINESSWONDATE) ,TO_DATE(PERFORMANCE_REPORTING.BUSINESSWONDATE) ) D
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.BRAND ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  dimension: day1 {
    type: date
    sql: ${TABLE}.DAY1 ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.REVENUE ;;
  }

  dimension: ytd_revenue {
    type: number
    sql: ${TABLE}.YTD_REVENUE ;;
  }

  set: detail {
    fields: [brand, year, day1, revenue, ytd_revenue]
  }
}
