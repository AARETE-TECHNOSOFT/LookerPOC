# The name of this view in Looker is "Ga Finance"
view: ga_finance {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".GA_FINANCE
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Avg App Open Rate" in Explore.

  dimension: avg_app_open_rate {
    type: number
    sql: ${TABLE}.AVG_APP_OPEN_RATE ;;
  }

  dimension: avg_playtime {
    type: number
    sql: ${TABLE}.AVG_PLAYTIME ;;
  }

  dimension: avg_screens_per_visit {
    type: number
    sql: ${TABLE}.AVG_SCREENS_PER_VISIT ;;
  }

  dimension: avg_session_length_sec {
    type: number
    sql: ${TABLE}.AVG_SESSION_LENGTH_SEC ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_session_length_sec {
    type: sum
    sql: ${avg_session_length_sec} ;;
  }

  measure: average_avg_session_length_sec {
    type: average
    sql: ${avg_session_length_sec} ;;
  }

  dimension: churn_rate {
    type: number
    sql: ${TABLE}.CHURN_RATE ;;
  }

  dimension: conversion_rate {
    type: number
    sql: ${TABLE}.CONVERSION_RATE ;;
  }

  dimension: cost_per_install {
    type: number
    sql: ${TABLE}.COST_PER_INSTALL ;;
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

  dimension: dau {
    type: number
    sql: ${TABLE}.DAU ;;
  }

  dimension: dau_per_mau {
    type: number
    sql: ${TABLE}.DAU_PER_MAU ;;
  }

  dimension: game {
    type: string
    sql: ${TABLE}.GAME ;;
  }

  dimension: ltv {
    type: number
    sql: ${TABLE}.LTV ;;
  }

  dimension: mau {
    type: number
    sql: ${TABLE}.MAU ;;
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}.NEW_USERS ;;
  }

  dimension: organic_conversion {
    type: number
    sql: ${TABLE}.ORGANIC_CONVERSION ;;
  }

  dimension: paid_conversion {
    type: number
    sql: ${TABLE}.PAID_CONVERSION ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.PLATFORM ;;
  }

  dimension: retention_rate {
    type: number
    sql: ${TABLE}.RETENTION_RATE ;;
  }

  dimension: returning_users {
    type: number
    sql: ${TABLE}.RETURNING_USERS ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.REVENUE ;;
  }

  dimension: revenue_budget {
    type: number
    sql: ${TABLE}.REVENUE_BUDGET ;;
  }

  dimension: revenue_per_paying_user {
    type: number
    sql: ${TABLE}.REVENUE_PER_PAYING_USER ;;
  }

  dimension: revenue_per_user {
    type: number
    sql: ${TABLE}.REVENUE_PER_USER ;;
  }

  dimension: revenue_per_user2 {
    type: number
    sql: ${TABLE}.REVENUE_PER_USER2 ;;
  }

  dimension: roi {
    type: number
    sql: ${TABLE}.ROI ;;
  }

  dimension: roi_percent {
    type: number
    sql: ${TABLE}.ROI_PERCENT ;;
  }

  dimension: roi_target {
    type: number
    sql: ${TABLE}.ROI_TARGET ;;
  }

  dimension: roi_target_percent {
    type: number
    sql: ${TABLE}.ROI_TARGET_PERCENT ;;
  }

  dimension: session_depth {
    type: number
    sql: ${TABLE}.SESSION_DEPTH ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.SESSIONS ;;
  }

  dimension: transactions {
    type: number
    sql: ${TABLE}.TRANSACTIONS ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
