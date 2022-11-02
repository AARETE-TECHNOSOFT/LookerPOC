# The name of this view in Looker is "Hra Monthly Analysis"
view: hra_monthly_analysis {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".HRA_MONTHLY_ANALYSIS
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.AGE ;;
  }

  dimension: age___ {
    type: number
    sql: ${TABLE}.AGE___ ;;
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

  dimension_group: date_of_hire {
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
    sql: ${TABLE}.DATE_OF_HIRE ;;
  }

  dimension_group: date_of_hire___ {
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
    sql: ${TABLE}.DATE_OF_HIRE___ ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.DEPARTMENT ;;
  }

  dimension: department_id {
    type: number
    sql: ${TABLE}.DEPARTMENT_ID ;;
  }

  dimension_group: dol {
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
    sql: ${TABLE}.DOL ;;
  }

  dimension: employee_in_out {
    type: string
    sql: ${TABLE}.EMPLOYEE_IN_OUT ;;
  }

  dimension: employee_name {
    type: string
    sql: ${TABLE}.EMPLOYEE_NAME ;;
  }

  dimension: employee_name__ {
    type: string
    sql: ${TABLE}.EMPLOYEE_NAME__ ;;
  }

  dimension: employee_type {
    type: string
    sql: ${TABLE}.EMPLOYEE_TYPE ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.GENDER ;;
  }

  dimension: gender______ {
    type: string
    sql: ${TABLE}.GENDER______ ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: month_no {
    type: number
    sql: ${TABLE}.MONTH_NO ;;
  }

  dimension: no_ {
    type: number
    sql: ${TABLE}.NO ;;
  }

  dimension: number_of_open_positions {
    type: number
    sql: ${TABLE}.NUMBER_OF_OPEN_POSITIONS ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number_of_open_positions {
    type: sum
    sql: ${number_of_open_positions} ;;
  }

  measure: average_number_of_open_positions {
    type: average
    sql: ${number_of_open_positions} ;;
  }

  dimension: open_position {
    type: string
    sql: ${TABLE}.OPEN_POSITION ;;
  }

  dimension: reason_for_term {
    type: string
    sql: ${TABLE}.REASON_FOR_TERM ;;
  }

  dimension: subdepartment_id {
    type: number
    sql: ${TABLE}.SUBDEPARTMENT_ID ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  measure: count {
    type: count
    drill_fields: [employee_name]
  }
}
