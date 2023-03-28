connection: "looker_poc"
include: "/**/*.view.lkml"


explore: hra_employee
{
  label:"Employees"
  join: hra_sub_department {
    type: left_outer
    relationship: many_to_one
    sql_on: ${hra_employee.subdepartment} =${hra_sub_department.subdepartment};;
  }

  join: hra_dates {
    type: left_outer
    relationship: many_to_one
    sql_on: ${hra_employee.doj_date} = ${hra_dates.datevalue_date};;
  }

 join: der_mon_ana_new {
   type: left_outer
   relationship: many_to_one
  sql_on: ${der_mon_ana_new.subdepartment_id}=${hra_sub_department.subdepartment};;
 }

join: Dates{
  from: hra_dates
  type: left_outer
  relationship: many_to_one
  sql_on: ${der_mon_ana_new.date__date}=${Dates.datevalue_date} ;;
  }

  join: hra_monthly_analysis {
    type: left_outer
    relationship: many_to_one
    sql_on: ${hra_monthly_analysis.subdepartment_id}=${hra_sub_department.subdepartment} ;;
  }
  }




explore: hra_training{
  label:"Training"
  join: hra_month_no {
    type: left_outer
    relationship: many_to_one
    sql_on: ${hra_training.month} = ${hra_month_no.month} ;;
  }
}
