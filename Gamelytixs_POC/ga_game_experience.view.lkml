# The name of this view in Looker is "Ga Game Experience"
view: ga_game_experience {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".GA_GAME_EXPERIENCE
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "API Latency In Secs" in Explore.

  dimension: api_latency_in_secs {
    type: number
    sql: ${TABLE}.API_LATENCY_IN_SECS ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_api_latency_in_secs {
    type: sum
    sql: ${api_latency_in_secs} ;;
  }

  measure: average_api_latency_in_secs {
    type: average
    sql: ${api_latency_in_secs} ;;
  }

  dimension: average_clicks_per_screen {
    type: number
    sql: ${TABLE}.AVERAGE_CLICKS_PER_SCREEN ;;
  }

  dimension: complete_scores {
    type: number
    sql: ${TABLE}.COMPLETE_SCORES ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: crashes {
    type: number
    sql: ${TABLE}.CRASHES ;;
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

  dimension: devices {
    type: number
    sql: ${TABLE}.DEVICES ;;
  }

  dimension: engagement_index_in_per_cent {
    type: number
    sql: ${TABLE}.ENGAGEMENT_INDEX_IN_PER_CENT ;;
  }

  dimension: fail_scores {
    type: number
    sql: ${TABLE}.FAIL_SCORES ;;
  }

  dimension: game {
    type: string
    sql: ${TABLE}.GAME ;;
  }

  dimension: level_completes {
    type: number
    sql: ${TABLE}.LEVEL_COMPLETES ;;
  }

  dimension: level_fails {
    type: number
    sql: ${TABLE}.LEVEL_FAILS ;;
  }

  dimension: level_starts {
    type: number
    sql: ${TABLE}.LEVEL_STARTS ;;
  }

  dimension: level_total_scores {
    type: number
    sql: ${TABLE}.LEVEL_TOTAL_SCORES ;;
  }

  dimension: load_time_in_secs {
    type: number
    sql: ${TABLE}.LOAD_TIME_IN_SECS ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.PLATFORM ;;
  }

  dimension: win_percentage {
    type: number
    sql: ${TABLE}.WIN_PERCENTAGE ;;
  }
  # dimension: Row_no {
  #   primary_key: yes
  #   type: number
  #   sql:  row_number() over(order by ${date__date}  ) ;;
  # }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: Crashes_TM {
    type: average
    sql: ${TABLE}.CRASHES ;;
  }
}
