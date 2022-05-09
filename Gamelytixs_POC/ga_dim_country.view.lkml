# The name of this view in Looker is "Ga Dim Country"
view: ga_dim_country {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".GA_DIM_COUNTRY
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Country" in Explore.

  dimension: country {
    type: string
    primary_key: yes
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
