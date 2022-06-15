# The name of this view in Looker is "Hr Monthly Analysis"

view: hr_monthly_analysis {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".HR_MONTHLY_ANALYSIS
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
    type: string
    sql: ${TABLE}.AGE___ ;;
  }


  dimension: date_ {
    type: date
    sql:CAST(${TABLE}.DATE_ AS date);;
    html: {{ rendered_value | date: "%d-%b-%y"}};;
  }

  dimension: date_of_hire {
    type: string
    sql: ${TABLE}."DATE_OF_HIRE" ;;
# sql:CAST(${TABLE}.DATE_OF_HIRE AS date);;
    #html: {{ rendered_value | date: "%d-%b-%y"}};;
  }
  dimension: date_of_hire___ {
    type: string
    sql: ${TABLE}.DATE_OF_HIRE___ ;;
  }



  dimension: department {
    type: string
    sql: ${TABLE}.DEPARTMENT ;;
    # html:
    # <a href="https://thirdi.looker.com/dashboards/112?Department%20Name={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year=&Month=Dec>{{rendered_value}}</a>
    # ;;
  }

  dimension: department_id {
    type: string
    sql: ${TABLE}.DEPARTMENT_ID ;;
  }

  dimension: dol {
    # type: date
    type: string
    sql: ${TABLE}.DOL ;;
    #sql:CAST(${TABLE}.DOL AS date);;
    #html: {{ rendered_value | date: "%d-%b-%y"}};;

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

  # dimension: compound_primary_key {
  #   primary_key: yes
  #   hidden: no
  #   type: string
  #   sql: CONCAT(${TABLE}.EMPLOYEE_NAME, ' ', ${TABLE}.department_id) ;;
  # }

  dimension: year {
    type: string
    sql: ${TABLE}."YEAR" ;;
  }

  measure: count {
    type: count
    drill_fields: [employee_name]
  }
  # dimension: primary_key {
  #   primary_key: yes
  #   sql: CONCAT(${TABLE}.subdepartment_id, ${TABLE}.department_id) ;;
  # }
# dimension: row_no {
#   type: number
#   primary_key: yes
#   sql: row_number() over(order by department_id desc ) ;;
# }

  measure: Total_open_positions {
    type: sum
    sql: ${number_of_open_positions} ;;
  }

}
