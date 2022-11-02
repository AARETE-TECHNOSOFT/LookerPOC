# The name of this view in Looker is "Hra Training"
view: hra_training {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".HRA_TRAINING
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Actual No of Participants" in Explore.

  dimension: actual_no_of_participants {
    type: number
    sql: ${TABLE}.ACTUAL_NO_OF_PARTICIPANTS ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_actual_no_of_participants {
    type: sum
    sql: ${actual_no_of_participants} ;;
  }

  measure: average_actual_no_of_participants {
    type: average
    sql: ${actual_no_of_participants} ;;
  }

  dimension: costs {
    type: number
    sql: ${TABLE}.COSTS ;;
  }

  dimension: external {
    type: number
    sql: ${TABLE}.EXTERNAL ;;
  }

  dimension: internal {
    type: number
    sql: ${TABLE}.INTERNAL ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: no_of_completed_training {
    type: number
    sql: ${TABLE}.NO_OF_COMPLETED_TRAINING ;;
  }

  dimension: occupancy_rate {
    type: number
    sql: ${TABLE}.OCCUPANCY_RATE ;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}.QUARTER ;;
  }

  dimension: training_costs_per_person {
    type: number
    sql: ${TABLE}.TRAINING_COSTS_PER_PERSON ;;
  }

  dimension: training_man_hr {
    type: number
    sql: ${TABLE}.TRAINING_MAN_HR ;;
  }

  dimension: traning_name {
    type: string
    sql: ${TABLE}.TRANING_NAME ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  measure: count {
    type: count
    drill_fields: [traning_name]
  }

  measure: Average_occupancyRate {
    type: average
    sql: ${occupancy_rate} ;;
    value_format: "0%"
    }

  measure: Training_man_hours {
    type: sum
    sql: ${training_man_hr} ;;

  }

  measure: sum_of_completed_training {
    type: number
    sql: sum(sum(DISTINCT ${TABLE}.NO_OF_COMPLETED_TRAINING)) OVER(partition BY ${TABLE}.QUARTER) ;;
    }

    measure: sum_of_costs{
      type: number
      sql: sum(sum(DISTINCT ${TABLE}.COSTS)) OVER(partition BY ${TABLE}.QUARTER) ;;
      value_format: "$0"
    }

    measure: Sum_of_Training_Cost_Per_Person{
    type: number
    sql:avg(avg(DISTINCT ${TABLE}.TRAINING_COSTS_PER_PERSON)) OVER(partition BY ${TABLE}.QUARTER) ;;
      value_format: "$0"
   }

}
