view: hr_dates {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".HR_DATES ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Datevalue" in Explore.

  required_access_grants: [My_Team]


  dimension: datevalue {
    primary_key: yes
    type: date
    sql:CAST(${TABLE}.DATEVALUE AS date);;
    html: {{ rendered_value | date: "%d-%b-%y"}};;
  }

  dimension: dayvalue {
    type: number
    sql:${TABLE}.DAYVALUE ;;

  }

  dimension: mon {
    type: string
    sql: ${TABLE}.MON ;;
  }

  dimension: monthvalue {
    type: number
    sql: ${TABLE}.MONTHVALUE ;;
  }

  dimension: monthvaluename {
    type: string
    sql: ${TABLE}.MONTHVALUENAME ;;
  }

  dimension: weekdayvalue {
    type: number
    sql: ${TABLE}.WEEKDAYVALUE ;;
  }

  dimension: weekdayvaluename {
    type: string
    sql: ${TABLE}.WEEKDAYVALUENAME ;;
  }

  dimension: yearvalue {
    type:string
    sql:${TABLE}.YEARVALUE;;
    html:
     <a href="https://thirdi.looker.com/dashboards/110?Department=IT%2FIS&Year={{ _filters['hr_dates.yearvalue'] | url_encode }}">{{ value }}</a>

      ;;
  }

  dimension: previousyearvalue {
    type:string
    sql:${TABLE}.previous_year;;
  }

# dimension: Year_value_Date {
#   datatype:date
#   sql:${TABLE}.YEARVALUE;;
# }
  dimension: Year_value_No {
    type: number
    value_format: "###0"
    sql:${TABLE}.YEARVALUE;;
  }

  measure: count {
    type: count
    drill_fields: [weekdayvaluename, monthvaluename]
  }

}
