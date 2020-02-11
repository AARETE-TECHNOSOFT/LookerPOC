view: date_table {
  derived_table: {
    sql: SELECT X.*,
           EXTRACT(YEAR FROM DAY1)  AS YEAR,
           EXTRACT(MONTH FROM DAY1) AS MONTH
    FROM (
SELECT PERFORMANCE_REPORTING.productclass AS BRAND,
  TO_DATE('2013-12-31','YYYY-MM-DD') + F.NUMBER1 as day1
    FROM C##LOOKER.PERFORMANCE_REPORTING
    CROSS JOIN (SELECT
                  ROW_NUMBER() OVER (order by 1) as number1
                  FROM
                    (SELECT 0 as n from dual UNION SELECT 1 from dual) p0,
                    (SELECT 0 as n from dual UNION SELECT 1 from dual) p1,
                    (SELECT 0 as n from dual UNION SELECT 1 from dual) p2,
                    (SELECT 0 as n from dual UNION SELECT 1 from dual) p3,
                    (SELECT 0 as n from dual UNION SELECT 1 from dual) p4,
                    (SELECT 0 as n from dual UNION SELECT 1 from dual) p6,
                    (SELECT 0 as n from dual UNION SELECT 1 from dual) p7,
                    (SELECT 0 as n from dual UNION SELECT 1 from dual) p8,
                    (SELECT 0 as n from dual UNION SELECT 1 from dual) p9,
                    (SELECT 0 as n from dual UNION SELECT 1 from dual) p10,
                    (SELECT 0 as n from dual UNION SELECT 1 from dual) p11,
                    (SELECT 0 as n from dual UNION SELECT 1 from dual) p12)F
                  --GROUP BY 1,2
                  ORDER BY 1,2) X
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

  dimension: day1 {
    type: date
    sql: ${TABLE}.DAY1 ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}."MONTH" ;;
  }

  set: detail {
    fields: [brand, day1, year, month]
  }
}
