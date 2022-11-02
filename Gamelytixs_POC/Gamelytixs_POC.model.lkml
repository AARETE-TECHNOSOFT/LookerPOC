connection: "test_oracle"

include: "/**/*.view.lkml"
include: "*.view"
include: "/views/*.view"
include: "/**/*.dashboard"
explore: ga_dim_date {
label: "GA_DimDate"
  join: ga_predictions {
    type: left_outer
    sql_on: ${ga_dim_date.quarter}=${ga_predictions.quarter} ;;
    relationship: many_to_one
  }

  join: ga_game_experience_drop_offs {
    type: left_outer
    sql_on: ${ga_game_experience_drop_offs.date__date}=${ga_dim_date.date__date} ;;
    relationship: many_to_one
  }

  join: ga_churn_rate_causes {
    type: left_outer
    sql_on: ${ga_churn_rate_causes.date__date}=${ga_dim_date.date__date} ;;
    relationship: many_to_one
  }

  join: ga_marketing {
    type: left_outer
    sql_on: ${ga_marketing.date__date}=${ga_dim_date.date__date} ;;
    relationship: many_to_one
  }

  join: ga_marketing_br_adv_analysis {
    type: left_outer
    sql_on: ${ga_marketing_br_adv_analysis.date__date}=${ga_dim_date.date__date} ;;
    relationship: many_to_one
  }

  join: ga_finance {
    type: left_outer
    sql_on: ${ga_finance.date__date}=${ga_dim_date.date__date} ;;
    relationship: many_to_one
  }

  join: ga_finance_revenue_stack {
    type: left_outer
    sql_on: ${ga_finance_revenue_stack.date__date}=${ga_dim_date.date__date} ;;
    relationship: many_to_one
  }

  join: ga_game_experience {
    type: left_outer
    sql_on: ${ga_game_experience.date__date}=${ga_dim_date.date__date} ;;
    relationship: many_to_one
  }

  join: ga_dim_country {
    type: left_outer
    sql_on: ${ga_finance.country}=${ga_dim_country.country} ;;
    relationship: many_to_one
  }

  join: ga_dim_game {
    type: left_outer
    sql_on: ${ga_game_experience.game}=${ga_dim_game.game} ;;
    relationship: many_to_one
  }

  join: ga_dim_platform {
    type: left_outer
    sql_on: ${ga_finance_revenue_stack.platform}=${ga_dim_platform.platform} ;;
    relationship: many_to_one
  }

  join: marketing_br_adv_derived {
    type: left_outer
    sql_on: ${marketing_br_adv_derived.date__date}=${ga_dim_date.date__date} ;;
    relationship: many_to_one
  }

  join: game_experience_derived {
    type: left_outer
    sql_on: ${game_experience_derived.date__date}=${ga_dim_date.date__date} ;;
    relationship: many_to_one
  }

  join: finance_revenue_stack_derived {
    type: left_outer
    sql_on: ${finance_revenue_stack_derived.date__date}=${ga_dim_date.date__date} ;;
    relationship: many_to_one
  }

  join: game_experience_drop_offs_derived {
    type: left_outer
    sql_on: ${game_experience_drop_offs_derived.date__date}=${ga_dim_date.date__date} ;;
    relationship: many_to_one
  }

  join: game_finance_derived {
    type: left_outer
    sql_on: ${game_finance_derived.date__date}=${ga_dim_date.date__date} ;;
    relationship: many_to_one
  }


}

explore: ga_kpi_definations {}
