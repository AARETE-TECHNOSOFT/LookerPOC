connection: "looker_poc"
include: "/**/*.view.lkml"



# datagroup: order_datagroup {
#   label: "desired label"
#   description: "description string"
#   max_cache_age: "24 hours"
#   sql_trigger: SELECT max(rOW_nO) FROM Der_Month_Ana ;;
# }

access_grant: My_Team{
  user_attribute: chaitalis_team
  allowed_values: [ "Shubhangi" ]
}

# access_grant: Shubhangi_Team {
#   user_attribute: trial_team
# allowed_values: ["Team"]
# }



explore: hr_employee
{
  label:"Employees"

  join: hr_subdepartment {
    type: left_outer
    relationship: many_to_one
    sql_on: ${hr_employee.subdepartment} = ${hr_subdepartment.subdepartment} ;;
  }


  join: hr_dates {
    type: left_outer
    relationship: many_to_one
    sql_on: ${hr_employee.doj} = ${hr_dates.datevalue};;
  }

  join: Dates{
    from: hr_dates
    type: left_outer
    relationship: many_to_one
    sql_on:${der_month_ana.date_}=${Dates.datevalue};;
  }

  join: previous_year {
    type: left_outer
    from: hr_employee
    relationship: one_to_one
    sql_on: ${hr_employee.yearofjoining} = ${previous_year.yearofjoining} +1  ;;
  }

  join: hr_monthly_analysis {
    type: left_outer
    relationship: many_to_one
    sql_on: ${hr_monthly_analysis.subdepartment_id}=${hr_subdepartment.subdepartment} ;;
  }

  join: der_month_ana
  {
    type: left_outer
    relationship: many_to_one
    sql_on: ${der_month_ana.subdepartment_id}=${hr_subdepartment.subdepartment} ;;
  }

  # join: monthly_analysis_derived
  # {
  #   type: left_outer
  #   relationship: many_to_one
  #   sql_on: ${monthly_analysis_derived.subdepartment_id}=${hr_subdepartment.subdepartment} ;;
  # }

  # join: dates1 {
  #   from: hr_dates
  #   type: left_outer
  #   relationship: many_to_one
  #   sql_on: ${der} ;;

  # }



}




explore: hr_training {
  label:"Training"
  join: hr_month_no {
    type: left_outer
    relationship: many_to_one
    sql_on: ${hr_training.month} = ${hr_month_no.month} ;;
  }
}
