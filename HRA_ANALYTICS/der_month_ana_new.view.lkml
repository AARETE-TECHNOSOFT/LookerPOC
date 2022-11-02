# If necessary, uncomment the line below to include explore_source.

# include: "HRA_NEW.model.lkml"

view: der_mon_ana_new {
  derived_table: {
    explore_source: hra_employee {
      column: age { field: hra_monthly_analysis.age }
      column: age___ { field: hra_monthly_analysis.age___ }
      column: date__date { field: hra_monthly_analysis.date__date }
      column: date_of_hire____date { field: hra_monthly_analysis.date_of_hire____date }
      column: date__month { field: hra_monthly_analysis.date__month }
      column: date__quarter { field: hra_monthly_analysis.date__quarter }
      column: date__week { field: hra_monthly_analysis.date__week }
      column: date__year { field: hra_monthly_analysis.date__year }
      column: date_of_hire_date { field: hra_monthly_analysis.date_of_hire_date }
      column: department { field: hra_monthly_analysis.department }
      column: department_id { field: hra_monthly_analysis.department_id }
      column: dol_date { field: hra_monthly_analysis.dol_date }
      column: employee_in_out { field: hra_monthly_analysis.employee_in_out }
      column: employee_name { field: hra_monthly_analysis.employee_name }
      column: employee_name__ { field: hra_monthly_analysis.employee_name__ }
      column: employee_type { field: hra_monthly_analysis.employee_type }
      column: gender { field: hra_monthly_analysis.gender }
      column: gender______ { field: hra_monthly_analysis.gender______ }
      column: month { field: hra_monthly_analysis.month }
      column: month_no { field: hra_monthly_analysis.month_no }
      column: number_of_open_positions { field: hra_monthly_analysis.number_of_open_positions }
      column: no_ { field: hra_monthly_analysis.no_ }
      column: open_position { field: hra_monthly_analysis.open_position }
      column: reason_for_term { field: hra_monthly_analysis.reason_for_term }
      column: subdepartment_id { field: hra_monthly_analysis.subdepartment_id }
      column: type { field: hra_monthly_analysis.type }
      column: year { field: hra_monthly_analysis.year }

    derived_column: row_no {
      sql: row_number() over(order by department_id desc ) ;;
      }
    }
  }

dimension: row_no {
  type: number
  primary_key: yes
}

  dimension: age {
    description: ""
    type: number
  }
  dimension: age___ {
    description: ""
    type: number
  }
  dimension: date__date {
    description: ""
    type: date
  }
  dimension: date_of_hire____date {
    description: ""
    type: date
  }
  dimension: date__month {
    description: ""
    type: date_month
  }
  dimension: date__quarter {
    description: ""
    type: date_quarter
  }
  dimension: date__week {
    description: ""
    type: date_week
  }
  dimension: date__year {
    description: ""
    type: date_year
  }
  dimension: date_of_hire_date {
    description: ""
    type: date
  }
  dimension: department {
    description: ""
  }
  dimension: department_id {
    description: ""
    type: number
  }
  dimension: dol_date {
    description: ""
    type: date
  }
  dimension: employee_in_out {
    description: ""
  }
  dimension: employee_name {
    description: ""
  }
  dimension: employee_name__ {
    description: ""
  }
  dimension: employee_type {
    description: ""
  }
  dimension: gender {
    description: ""
  }
  dimension: gender______ {
    description: ""
  }
  dimension: month {
    description: ""
  }
  dimension: month_no {
    description: ""
    type: number
  }
  dimension: number_of_open_positions {
    description: ""
    type: number
  }
  dimension: no_ {
    description: ""
    type: number
  }
  dimension: open_position {
    description: ""
  }
  dimension: reason_for_term {
    description: ""
  }
  dimension: subdepartment_id {
    description: ""
    type: number
  }
  dimension: type {
    description: ""
  }
  dimension: year {
    description: ""
    type: number
  }

  measure: No_of_Open_Positions{
    type: sum
    sql: ${number_of_open_positions} ;;
  }

  measure: Permanent_Positions{
    type: sum
    sql: ${number_of_open_positions} ;;
    filters: [employee_type: "Permanent"]
  }

  measure:Contract_Positions{
    type: sum
    sql: ${number_of_open_positions} ;;
    filters: [employee_type: "Contract/Temp"]
  }

  measure: EMP_In_Out_Count{
    type: sum
    sql: ${no_} ;;
  }
}
