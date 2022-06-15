# The name of this view in Looker is "Ga Dim Date"
view: ga_dim_date {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".GA_DIM_DATE
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date_ {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DATE_ ;;
   # html: <p style="font-size:25px;display: inline-block;">{{rendered_value}}</p> ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Month" in Explore.

  dimension: month {
    type: number
    sql: ${TABLE}."MONTH" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

# dimension: group_function {
#     type: number
#     sql: row_number() over(PARTITION by ${date__month} order by date__date desc ) ;;

# }
  measure: total_month {
    type: sum
    sql: ${month} ;;
  }

  measure: average_month {
    type: average
    sql: ${month} ;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}.QUARTER ;;
  }

  dimension_group: start_of_year {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.START_OF_YEAR ;;
  }
  measure: Session_Length_Target {
    type: number
    sql: 600 ;;
  }


  measure: Devices_Target {
    type: number
    sql: 45000 ;;
  }

  measure: Brand_Reach_Target {
    type: number
    sql: 80000 ;;
  }




  measure: count {
    type: count
    drill_fields: []
  }

measure: Session_Length_last12months {
  type: number
  sql: case when ${Last12month}=1 then
  avg(${ga_finance.avg_session_length_sec}) else null end;;
  value_format: "0.0"
}



  filter: month_filter {
    type: date
   #suggestions: ["2020-12-01"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]
  }


  filter: month_filter1 {
    type: string
    #suggestions: ["2020-12-01"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]
  }


    dimension: Start_Date {
      type: string
      sql: '2020-01-01' ;;

    }

    dimension: End_Date {
      type: string
      sql: case when {% condition month_filter %} to_date(${date__date},'yyyy-mm-dd') {% endcondition %} then ${date__date}  end ;;

    }


    measure: Last12month {
      type: average
      sql:case when ${date__date}>= ${Start_Date} and to_date(${date__date},'yyyy-mm-dd')< {% date_end month_filter %} then 1 else 0 end  ;;
      # value_format: "0.0"
}

  measure: Last12month1 {
    type: average
    sql:case when to_date(${date__date},'yyyy-mm-dd') >= {% date_start month_filter %}
    and to_date(${date__date},'yyyy-mm-dd')< {% date_end month_filter %}
    then ${ga_finance.avg_session_length_sec} end  ;;
    value_format: "0.0"

  }

  dimension: htmlcode_Overview
  {
    sql: 1 ;;
    html:
    <html>
    <body>
    <div style="border-bottom: solid 1px #4285F4;">
    <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">

      <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" >

      Overview</a>

      <a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Finance</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>User Engagement </big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Game Experience</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Marketing</big></a>&emsp;&emsp;


      </nav>

      </div>
      </body>
      </html>;;
  }



  dimension: htmlcode_Finance
  {
    sql: 1 ;;
    html:
    <html>
    <body>
    <div style="border-bottom: solid 1px #4285F4;">
    <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">


      <a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Overview</big></a>&emsp;&emsp;

      <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" >
      Finance </a>

      <a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>User Engagement </big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Game Experience</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Marketing</big></a>&emsp;&emsp;


      </nav>

      </div>
      </body>
      </html>;;
  }

  dimension: htmlcode_UserEngagement
  {
    sql: 1 ;;
    html:
    <html>
    <body>
    <div style="border-bottom: solid 1px #4285F4;">
    <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">


      <a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Overview</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Finance </big></a>&emsp;&emsp;

      <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" >

      User Engagement</a>

      <a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Game Experience</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Marketing</big></a>&emsp;&emsp;


      </nav>

      </div>
      </body>
      </html>;;
  }

  dimension: htmlcode_GameExperience
  {
    sql: 1 ;;
    html:
    <html>
    <body>
    <div style="border-bottom: solid 1px #4285F4;">
    <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">


      <a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Overview</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Finance </big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>User Engagement </big></a>&emsp;&emsp;

      <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" >

     Game Experience</a>

     <a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Marketing</big></a>&emsp;&emsp;


      </nav>

      </div>
      </body>
      </html>;;
  }


  dimension: htmlcode_Marketing
  {
    sql: 1 ;;
    html:
    <html>
    <body>
    <div style="border-bottom: solid 1px #4285F4;">
    <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">



      <a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Overview</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Finance </big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>User Engagement</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"><big>Game Experience</big></a>&emsp;&emsp;

       <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" >

      Marketing</a>

      </nav>

      </div>
      </body>
      </html>;;
  }


  measure:CreatingNewTable{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 5px;" >
      <tr>
      <td style="text-align:center;width:200px;">
      <p >{{finance_revenue_stack_derived.Revenue_Selected_Month._value}}
      </p>
      </td>
      <td style="text-align:center;width:200px;">
      <p >{{ga_finance.ARPU_selected_month._value}}
      </p>
      </td>
     </tr>

    <tr>
      <td style="text-align:center; width:200px;">
      <p>{{finance_revenue_stack_derived.Revenue_Growth._value}}
      </p>
      </td>
      <td style="text-align:center; width:200px;">
      <p>{{ga_finance.ARPU_Growth._value}}
      </p>
      </td>
    </tr>
      </table>



      </body>
      </html>
      ;;
  }



}
