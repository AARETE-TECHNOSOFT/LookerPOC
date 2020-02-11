view: projected_revenue {
  derived_table: {
    sql: SELECT  ROW_NUMBER() OVER (ORDER BY DAY1) AS PK,
        BRAND,
        YEAR,
        DAY1,
        CASE WHEN DAY1 < CURRENT_DATE THEN REVENUE
              ELSE LAST_REVENUE*(1+LAST_VALUE(PERCENT_CHANGE IGNORE NULLS) OVER (PARTITION BY BRAND ORDER BY DAY1 ROWS UNBOUNDED PRECEDING))
              END                                                                         AS REVENUE,
        CASE WHEN DAY1 >= CURRENT_DATE THEN 'Yes' ELSE 'No' END AS PROJECTED
FROM (
SELECT Y.*,
      1.0*(YTD_REVENUE - LAST_YTD_REVENUE)/NULLIF(LAST_YTD_REVENUE,0) AS PERCENT_CHANGE
FROM (
SELECT DT.BRAND                                                            AS BRAND,
       DT.YEAR                                                             AS YEAR,
       DT.DAY1                                                             AS DAY1,
       DH.REVENUE                                                          AS REVENUE,
       DH.YTD_REVENUE                                                      AS YTD_REVENUE,
       LAG(DH.REVENUE,CASE WHEN MOD(DT.YEAR,4) = 0 AND DT.MONTH > 2 THEN 366 ELSE 365 END) OVER(ORDER BY DT.DAY1)     AS LAST_REVENUE,
       LAG(DH.YTD_REVENUE,CASE WHEN MOD(DT.YEAR,4) = 0 AND DT.MONTH > 2 THEN 366 ELSE 365 END) OVER(ORDER BY DT.DAY1) AS LAST_YTD_REVENUE
FROM (SELECT X.*,
           EXTRACT(YEAR FROM DAY1)  AS YEAR,
           EXTRACT(MONTH FROM DAY1) AS MONTH
    FROM (
SELECT PERFORMANCE_REPORTING.productclass AS BRAND,
  TO_DATE('2018-12-31','YYYY-MM-DD') + F.NUMBER1 as DAY1
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
                  GROUP BY PERFORMANCE_REPORTING.productclass, TO_DATE('2018-12-31','YYYY-MM-DD') + F.NUMBER1
                  ORDER BY 1,2) X) DT
LEFT JOIN (SELECT D.*,
                  SUM(REVENUE) OVER(PARTITION BY BRAND,YEAR ORDER BY DAY1 ROWS UNBOUNDED PRECEDING)        AS YTD_REVENUE
           FROM (
           SELECT   PERFORMANCE_REPORTING.productclass                                                                   AS BRAND,
                    EXTRACT(YEAR FROM PERFORMANCE_REPORTING.BUSINESSWONDATE)                                             AS YEAR,
                    TO_DATE(PERFORMANCE_REPORTING.BUSINESSWONDATE)                                                       AS DAY1,
                    SUM(ACTUALTOTALUSD)                                                                       AS REVENUE
           FROM     C##LOOKER.PERFORMANCE_REPORTING
           GROUP BY productclass,EXTRACT(YEAR FROM PERFORMANCE_REPORTING.BUSINESSWONDATE) ,TO_DATE(PERFORMANCE_REPORTING.BUSINESSWONDATE) ) D) DH
           ON TO_DATE(DT.DAY1) = TO_DATE(DH.DAY1)
           AND DT.BRAND = DH.BRAND
ORDER BY DT.BRAND,DT.YEAR,DT.DAY1) Y) YY
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.PK ;;
  }

  dimension: year {
    hidden: yes
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  dimension_group: day1 {
    label: "Won"
    timeframes: [raw,date,day_of_month,week_of_year,month,quarter,year,day_of_year,month_name,month_num]
    type: time
    sql: ${TABLE}.DAY1 ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.REVENUE ;;
    value_format_name: usd
  }

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
    value_format_name: usd_0
    drill_fields: [day1_month,actual_revenue,projected_revenue,total_revenue]
  }

  measure: projected_revenue {
    type: sum
    sql: ${revenue} ;;
    filters: {
      field: projected
      value: "Yes"
    }
    value_format_name: usd_0
    drill_fields: [day1_month,total_revenue]
  }

  measure: actual_revenue {
    type: sum
    sql: ${revenue} ;;
    filters: {
      field: projected
      value: "No"
    }
    value_format_name: usd_0
    drill_fields: [day1_month,total_revenue]
  }

  dimension: projected {
    type: yesno
    sql: ${TABLE}.PROJECTED = 'Yes' ;;
  }

  set: detail {
    fields: [pk, year, revenue, projected]
  }
}
