# The name of this view in Looker is "Ga Marketing Br Adv Analysis"
view: ga_marketing_br_adv_analysis {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".GA_MARKETING_BR_ADV_ANALYSIS
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age 10 14" in Explore.

  dimension: age_10_14 {
    type: number
    sql: ${TABLE}.AGE_10_14 ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age_10_14 {
    type: sum
    sql: ${age_10_14} ;;
  }

  measure: average_age_10_14 {
    type: average
    sql: ${age_10_14} ;;
  }

  dimension: age_15_19 {
    type: number
    sql: ${TABLE}.AGE_15_19 ;;
  }

  dimension: age_20_24 {
    type: number
    sql: ${TABLE}.AGE_20_24 ;;
  }

  dimension: age_25_30 {
    type: number
    sql: ${TABLE}.AGE_25_30 ;;
  }

  dimension: age_30_ {
    type: number
    sql: ${TABLE}.AGE_30_ ;;
  }

  dimension: appstore {
    type: number
    sql: ${TABLE}.APPSTORE ;;
  }

  dimension: cohort_a {
    type: number
    sql: ${TABLE}.COHORT_A ;;
  }

  dimension: cohort_b {
    type: number
    sql: ${TABLE}.COHORT_B ;;
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

  dimension: facebook_reach {
    type: number
    sql: ${TABLE}.FACEBOOK_REACH ;;
  }

  dimension: game {
    type: string
    sql: ${TABLE}.GAME ;;
  }

  dimension: instagram_reach {
    type: number
    sql: ${TABLE}.INSTAGRAM_REACH ;;
  }

  dimension: microsoft_store {
    type: number
    sql: ${TABLE}.MICROSOFT_STORE ;;
  }

  dimension: other_channels_reach {
    type: number
    sql: ${TABLE}.OTHER_CHANNELS_REACH ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.PLATFORM ;;
  }

  dimension: playstore {
    type: number
    sql: ${TABLE}.PLAYSTORE ;;
  }

  dimension: youtube_reach {
    type: number
    sql: ${TABLE}.YOUTUBE_REACH ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
