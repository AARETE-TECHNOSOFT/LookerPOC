view: der_month_ana {

  derived_table: {
    explore_source: hr_employee {
      column: age { field: hr_monthly_analysis.age }
      column: age___ { field: hr_monthly_analysis.age___ }
      column: date_ { field: hr_monthly_analysis.date_ }
      column: date_of_hire { field: hr_monthly_analysis.date_of_hire }
      column: date_of_hire___ { field: hr_monthly_analysis.date_of_hire___ }
      column: department { field: hr_monthly_analysis.department }
      column: department_id { field: hr_monthly_analysis.department_id }
      column: dol { field: hr_monthly_analysis.dol }
      column: employee_in_out { field: hr_monthly_analysis.employee_in_out }
      column: employee_name { field: hr_monthly_analysis.employee_name }
      column: employee_name__ { field: hr_monthly_analysis.employee_name__ }
      column: employee_type { field: hr_monthly_analysis.employee_type }
      column: gender { field: hr_monthly_analysis.gender }
      column: gender______ { field: hr_monthly_analysis.gender______ }
      column: month { field: hr_monthly_analysis.month }
      column: month_no { field: hr_monthly_analysis.month_no }
      column: no_ { field: hr_monthly_analysis.no_ }
      column: number_of_open_positions { field: hr_monthly_analysis.number_of_open_positions }
      column: open_position { field: hr_monthly_analysis.open_position }
      #column: primary_key { field: hr_monthly_analysis.primary_key }
      column: reason_for_term { field: hr_monthly_analysis.reason_for_term }
      column: subdepartment_id { field: hr_monthly_analysis.subdepartment_id }
      column: type { field: hr_monthly_analysis.type }
      column: year { field: hr_monthly_analysis.year }
      # column: datevalue {
      # field: :hr_dates.datevalue
      # }

      derived_column: rOW_nO {
        sql: row_number() over(order by department_id desc ) ;;
      }

    }
    # datagroup_trigger: order_datagroup
  }
  filter: hr_monthly_analysis.gender_filter {
    type: string
    suggestions: ["Male", "Female"]
  }
  # dimension: datevalue {
  # type: date
  # }
  dimension: age {
    type: number
  }
  dimension: age___ {}
  dimension: date_ {
    type: date
  }
  dimension: date_of_hire {}
  dimension: date_of_hire___ {}
  dimension: department {}
  dimension: department_id {}
  dimension: dol {}

 dimension: employee_in_out
{
    # type: string
    # sql: CASE
    #       WHEN hr_monthly_analysis.employee_in_out='Begining of Term Employee'
    #       THEN 'Begining of Term EMP'
    #       WHEN hr_monthly_analysis.employee_in_out='Number of New Employee'
    #       THEN 'No. of New EMP'
    #       WHEN hr_monthly_analysis.employee_in_out='Number of Leavers'
    #       THEN 'No. of Leavers'
    #       END
    # ;;
  }

  dimension: employee_name {}
  dimension: employee_name__ {}
  dimension: employee_type {}
  dimension: gender {}
  dimension: gender______ {}
  dimension: month {}
  dimension: month_no {
    type: number
  }
  dimension: no_ {
    type: number
  }
  dimension: number_of_open_positions {
    type: number
  }
  dimension: open_position {}
  #dimension: primary_key {}
  dimension: reason_for_term {}
  dimension: subdepartment_id {
    type: number
  }
  dimension: type {}
  dimension: year {}

  dimension: Row_No {
    type: number
    primary_key: yes
  }

  measure: Total_Open_Positions
  {
    type: sum
    sql: ${number_of_open_positions};;
  }





}
