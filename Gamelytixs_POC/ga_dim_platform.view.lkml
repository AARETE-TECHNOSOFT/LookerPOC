# The name of this view in Looker is "Ga Dim Platform"
view: ga_dim_platform {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".GA_DIM_PLATFORM
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Platform" in Explore.

  dimension: platform {
    primary_key: yes
    type: string
    sql: ${TABLE}.PLATFORM ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
