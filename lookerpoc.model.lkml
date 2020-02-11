connection: "test_oracle"

# include all the views
include: "*.view"

datagroup: lookerpoc_default_datagroup {
  sql_trigger: SELECT 1  ;;
  #max_cache_age: "1 hour"
}

persist_with: lookerpoc_default_datagroup

explore: performance_pdt {}

explore: projected_revenue {}
