view: indicator_fd {
  derived_table: {
    sql: select data_up value ,indicator from ms_fd
         union all
        select data_update value ,indicator_  from percent_fd

          ;;
  }

  dimension: Percent_value {
    type: number
    sql: ${TABLE}.value ;;
    value_format: "0.00%"
  }
  dimension:  value{
    type:string
    sql: ${TABLE}.value ;;
   # value_format: "0.00%"
  }
  dimension:  indicator{
    type: string
    sql: ${TABLE}.indicator ;;

  }
}
