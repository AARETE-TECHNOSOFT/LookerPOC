view: hr_training {

  sql_table_name: "C##LOOKER".HR_TRAINING
    ;;


  dimension: actual_no_of_participants {
    type: number
    sql: ${TABLE}.ACTUAL_NO_OF_PARTICIPANTS ;;
  }



  measure: total_actual_no_of_participants {
    type: sum
    sql: ${actual_no_of_participants} ;;
    # html:
    # <html>
    # <p style=" text-align:center;font-size:23px;">{{rendered_value}}</p>
    # </html>
    # ;;
  }

  measure: average_actual_no_of_participants {
    type: average
    sql: ${actual_no_of_participants} ;;
  }

  dimension: costs {

    type: number
    sql: ${TABLE}.COSTS ;;
  }
  measure: sum_training_cost {
    type: number
    sql: sum(${costs});;
    #value_format: "$#,##0"
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
  measure: Average_occupancyRate {
    type: average
    sql: ${occupancy_rate} ;;
    value_format: "0%"
    # html:
    # <html>
    # <p style=" text-align:center;font-size:23px;">{{rendered_value}}</p>
    # </html>;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}.QUARTER ;;
  }

  dimension: training_costs_person {
    type: number
    sql: ${TABLE}.TRAINING_COSTS_PERSON ;;
  }

  dimension: training_man_hr {
    type: number
    sql: ${TABLE}.TRAINING_MAN_HR ;;
  }

  dimension: traning_name {
    type: string
   # sql: ${TABLE}.TRANING_NAME ;;
    sql: case when ${TABLE}.TRANING_NAME = 'Production Trianing 3' then 'Production Training 3'
    else ${TABLE}.TRANING_NAME end ;;

  }

  dimension: year {
    type: string
    sql: ${TABLE}.YEAR;;
  }

  measure: Training_man_hours {
    type: sum
    sql: ${training_man_hr} ;;
    # html:
    # <p style="font-size:23px;">{{rendered_value}} </p>
    # ;;
  }

  measure: count {
    type: count
    drill_fields: [traning_name]
  }

  measure: sum_completed_training {
    type: sum
    sql: ${no_of_completed_training} ;;
  }

}
