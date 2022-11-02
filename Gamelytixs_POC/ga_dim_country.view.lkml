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
    # html:

    # <a href="https://thirdi.looker.com/dashboards/150?Date Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank">{{ value }}</a>



    # ;;

  }

  # dimension: htmlcode11
  # {
  #   sql: 1 ;;
  #   html:
  #   <html>
  #   <body>
  #   <div style="border-bottom: solid 1px #4285F4;">
  #   <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">

  #     <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" >

  #     Overview</a>

  #     <a href="https://thirdi.looker.com/dashboards/150?Date Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}"  style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Finance</big></a>&emsp;&emsp;

  #     <a href=" https://thirdi.looker.com/dashboards/107" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>User Engagement</big></a>&emsp;&emsp;

  #     <a href="https://thirdi.looker.com/dashboards/112?Department+={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year={{ _filters['hr_dates.yearvalue'] | url_encode }}&Month=Dec" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;">{value}<big>Game Experience</big></a>&emsp;&emsp;

  #     <a href="https://thirdi.looker.com/dashboards/103?Quarter=&Year={{ _filters['hr_dates.yearvalue'] | url_encode }}"  style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Marketing</big></a>&emsp;&emsp;


  #     </nav>

  #     </div>
  #     </body>
  #     </html>;;
  # }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
}
