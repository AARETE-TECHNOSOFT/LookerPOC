# The name of this view in Looker is "Ga Kpi Definations"
view: ga_kpi_definations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".GA_KPI_DEFINATIONS
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Defination" in Explore.

  dimension: defination {
    type: string
    sql: ${TABLE}.DEFINATION ;;
  }

  dimension: kpi {
    type: string
    sql: ${TABLE}.KPI ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
