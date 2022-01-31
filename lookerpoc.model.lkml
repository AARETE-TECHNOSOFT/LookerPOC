connection: "test_oracle"

# include all the views
include: "*.view"
include: "/views/*.view"
include: "/**/*.dashboard"

label: "Fidelis_Care"
explore: data_fidelis_
{
  #label: "@{Static_Type_measure} data_fidelis"

  join: provider_overview_fd
  {
    type: left_outer
    sql_on: ${data_fidelis_.prov_irs_num}=${provider_overview_fd.prov_irs_num_tin} ;;
    relationship: many_to_one
  }
  join: dimdate_fid
  {
    type: left_outer
    sql_on: ${data_fidelis_.dos_year_month}=${dimdate_fid.date_} ;;
    relationship: many_to_one
  }

}
explore: provider_derivetable {
  join: data_fidelis_ {
    type: left_outer
    sql_on: ${data_fidelis_.prov_irs_num}=${provider_derivetable.prov_irs_num_tin} ;;
    relationship: many_to_one
  }

}
explore: spend_breakout_fd {

}


explore: indicator_fd {

}
explore: percent_fd {}
explore: spend_in_previous_years_fd {}
explore: ms_fd {}
explore: cost_indicator_fd {}
explore: quality_indicator_fd {}
explore: mlc_fd {}
explore: hospital_profit_fd {}
explore: market_share_fd {}

#explore: hr_dates {}
datagroup: lookerpoc_default_datagroup {
  sql_trigger: SELECT 1  ;;
  #max_cache_age: "1 hour"
}

persist_with: lookerpoc_default_datagroup

explore: performance_pdt {}

explore: projected_revenue {}
