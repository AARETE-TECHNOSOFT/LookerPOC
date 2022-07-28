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

  measure: htmlcode_Overview
  {
    sql: 1 ;;
    type: number
    html:
    <html>
    <body>
    <div style="border-bottom: solid 1px #4285F4;">
    <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 50px">

      <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 30px; font-weight: bold; background-color: #eaf1fe;" >

      OVERVIEW</a>

      <a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>FINANCE</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>USER ENGAGEMENT</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>GAME EXPERIENCE</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>MARKETING</big></a>&emsp;&emsp;


      </nav>

      </div>
      </body>
      </html>;;
  }




 measure: htmlcode_Overview1
  {
    sql: 1 ;;

    html:
    <html>
    <body>
    <div style="border-radius: 5px; padding: 5px 10px; background: #A9A9A9; height: 60px; color: red;">
    <nav style="font-size: 18px;">
     <img style="color: #efefef; padding: 5px 15px; float: left; height: 40px;" src=""/>
      <a style="color: #efefef; padding: 5px 15px; float: left; line-height: 40px; font-weight: bold;" >

      Overview</a>

      <a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"
      style="color: #efefef; padding: 5px 15px; float: left; line-height: 40px;" href="#finance">Finance</a>

      <a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"
      style="color: #efefef; padding: 5px 15px; float: left; line-height: 40px;" href="#user engagement">User Engagement</a>

      <a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"
      style="color: #efefef; padding: 5px 15px; float: left; line-height: 40px;" href="#game experience">Game Experience</a>

      <a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"
      style="color: #efefef; padding: 5px 15px; float: left; line-height: 40px;" href="#marketing">Marketing</a>


      </nav>

      </div>
      </body>
      </html>;;
  }

  dimension: htmlcode_Overview2
  {
    sql: 1 ;;

    html:
    <html>
    <body>


<div style="margin: auto; ">

<a style="

  color: #fff;

    background-color: #4285F4;

    border-color: #4285F4;

    float: left;

    font-weight: 400;

    text-align: center;

    vertical-align: middle;

    cursor: pointer;

    user-select: none;

    padding: 10px;

    margin: 5px;

    font-size: 1rem;

    line-height: 1.5;

    border-radius: 5px;"

    href="#">

    Overview

</a>



<a style="

  color: #fff;

    background-color: #EA4335;

    border-color: #EA4335;

    float: left;

    font-weight: 400;

    text-align: center;

    vertical-align: middle;

    cursor: pointer;

    user-select: none;

    padding: 10px;

    margin: 5px;

    font-size: 1rem;

    line-height: 1.5;

    border-radius: 5px;"

    href="#">

    Finance

</a>



<a style="

  color: #fff;

    background-color: #FBBC04;

    border-color: #FBBC04;

    float: left;

    font-weight: 400;

    text-align: center;

    vertical-align: middle;

    cursor: pointer;

    user-select: none;

    padding: 10px;

    margin: 5px;

    font-size: 1rem;

    line-height: 1.5;

    border-radius: 5px;"

    href="#">

    User Engagement

</a>



<a style="

  color: #fff;

    background-color: #34A852;

    border-color: #34A852;

    float: left;

    font-weight: 400;

    text-align: center;

    vertical-align: middle;

    cursor: pointer;

    user-select: none;

    padding: 10px;

    margin: 5px;

    font-size: 1rem;

    line-height: 1.5;

    border-radius: 5px;"

    href="#">

    Game Experience

</a>



<a style="

  color: #fff;

    background-color: ##00FFFF;

    border-color: #00FFFF;

    float: left;

    font-weight: 400;

    text-align: center;

    vertical-align: middle;

    cursor: pointer;

    user-select: none;

    padding: 10px;

    margin: 5px;

    font-size: 1rem;

    line-height: 1.5;

    border-radius: 5px;"

    href="#">

    Marketing

</a>

</div>


      </body>
      </html>;;
  }

  measure: htmlcode_overview123
  {
    sql: 1 ;;
    type: number
    html:
    <html>
    <body>
    <div style="border: solid 1px #4285F4; border-radius: 5px; padding: 5px 10px;height: 60px">
    <nav style="font-size: 18px;">

      <a style="padding: 5px;float:left; line-height: 40px;font-weight:bold;"><u><big>
      Overview</big></u></a> &emsp;&emsp;&emsp;&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px; float: left; line-height: 40px;"><big>Finance</big></a>&emsp;&emsp;&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px; float: left; line-height: 40px;"><big>User Engagement</big></a>&emsp;&emsp;&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px; float: left; line-height: 40px;"><big>Game Experience</big></a>&emsp;&emsp;&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px; float:left; line-height:40px;"><big>Marketing</big></a>&emsp;&emsp;&emsp;&emsp;


      </nav>

      </div>
      </body>
      </html>;;
  }



  measure: htmlcode_Finance
  {
    sql: 1 ;;
    type: number
    html:
    <html>
    <body>
    <div style="border-bottom: solid 1px #4285F4;">
    <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 50px">

      <a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>OVERVIEW</big></a>&emsp;&emsp;

      <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 30px; font-weight: bold; background-color: #eaf1fe;" >
      FINANCE</a>

      <a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>USER ENGAGEMENT</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>GAME EXPERIENCE</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float:left; line-height:40px;"><big>MARKETING</big></a>&emsp;&emsp;


      </nav>

      </div>
      </body>
      </html>;;
  }

  measure: htmlcode_UserEngagement
  {
    sql: 1 ;;
    type: number
    html:
    <html>
    <body>
    <div style="border-bottom: solid 1px #4285F4;">
    <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 50px">


      <a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>OVERVIEW</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>FINANCE </big></a>&emsp;&emsp;

      <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 30px; font-weight: bold; background-color: #eaf1fe;" >

      USER ENGAGEMENT</a>

      <a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>GAME EXPERIENCE</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>MARKETING</big></a>&emsp;&emsp;


      </nav>

      </div>
      </body>
      </html>;;
  }

  measure: htmlcode_GameExperience
  {
    sql: 1 ;;
    type: number
    html:
    <html>
    <body>
    <div style="border-bottom: solid 1px #4285F4;">
    <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 50px">


      <a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px;  float: left; line-height: 40px;"><big>OVERVIEW</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px;  float: left; line-height: 40px;"><big>FINANCE</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>USER ENGAGEMENT</big></a>&emsp;&emsp;

      <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 30px; font-weight: bold; background-color: #eaf1fe;" >

     GAME EXPERIENCE</a>

     <a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px;float: left; line-height: 40px;"><big>MARKETING</big></a>&emsp;&emsp;


      </nav>

      </div>
      </body>
      </html>;;
  }


  measure: htmlcode_Marketing
  {
    sql: 1 ;;
    type: number
    html:
    <html>
    <body>
    <div style="border-bottom: solid 1px #4285F4;">
    <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 50px">



      <a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>OVERVIEW</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>FINANCE</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>USER ENGAGEMENT</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" style="padding: 5px 15px; float: left; line-height: 40px;"><big>GAME EXPERIENCE</big></a>&emsp;&emsp;

       <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 30px; font-weight: bold; background-color: #eaf1fe;" >

      MARKETING</a>

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


dimension: finance_header_overview {
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Finance &nbsp;

      </h1>
      </html>
      ;;
  }


  dimension: User_Engagement_header_overview {
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">User Engagement &nbsp;

      </h1>
      </html>
      ;;
  }

  dimension: Top_Events_header_overview {
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Top Events &nbsp;

      </h1>
      </html>
      ;;
  }

  dimension: top_events {
    sql: 1;;
   html:
  <html>
  <div style="color:white; background-color: #FFFFFF;border:5x;"><BR style="line-height:1.0;"><h4 style="color:#3388ff;font-size: 13pt; margin:10px auto;text-align:LEFT; padding-left: 20px;">
  War Maniacs - New Updated Released v1.0.2  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;<font style="font-size: 11pt; color:#808080">20 mins ago</font></h4>
<h4 style="color:#808080;font-size: 12pt; margin:10px auto;text-align:LEFT; padding-left: 20px;"> iOS </h4>
<hr>
<h4 style="color:#3388ff;font-size: 13pt; margin:10px auto;text-align:LEFT; padding-left: 20px;">
  Plexus - Download Decreased by 8% &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<font style="font-size: 11pt; color:#808080">2 hours ago</font></h4>
<h4 style="color:#808080;font-size: 12pt; margin:10px auto;text-align:LEFT; padding-left: 20px;"> Android</h4>
<hr>
<h4 style="color:#3388ff;font-size: 13pt; margin:10px auto;text-align:LEFT; padding-left: 20px;">
  Arena - Fire - Churn Rate Increased by 4% &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;<font style="font-size: 11pt; color:#808080">20 mins ago</font></h4>
<h4 style="color:#808080;font-size: 12pt; margin:10px auto;text-align:LEFT; padding-left: 20px;"> iOS </h4>
<p style="text-align:center;">
<button type="button" style="border-radius:5px;margin:10px;text-align: center;vertical-align: middle;margin:10px;line-height: 1.8; width:120px;height:40px;border: none;color: white; text-align: center;text-decoration: none;display: inline-block;font-size: 14px;margin: 4px 2px;transition-duration: 0.4s; cursor: pointer;background-color: white;
  color: #3388ff; border: 2px solid #3388ff;

 }
  ">MORE EVENTS</button></p>
<BR style="line-height:1.5;"></div>

</html>
    ;;
  }

  dimension: Game_Experience_header_overview {
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Game Experience &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Marketing_header_overview {
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Marketing &nbsp;

      </h1>
      </html>
      ;;
  }

  dimension: Session_Analysis_header_overview {
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Session Analysis &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Prediction_Metrics_header_overview {
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Prediction Metrics &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: KPI_DICTIONARY_header_overview {
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">KPI Dictionary &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: MAU_header_UserEngagement{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">MAU &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Quick_Stats_header_UserEngagement{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Quick Stats &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Devices_header_GameExperience{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Devices &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Brand_reach_header_Marketing{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Brand Reach By Channels &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Advanced_analysis_header_Marketing{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Advanced Analysis &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Marketing_Details_header_Marketing{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Marketing Details &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Churn_Rate_And_Causes_header_UserEngagement{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Churn Rate & Causes &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Drop_Offs_And_Causes_header_GameExperience{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Drop Offs & Causes &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: User_Engagement_Details_header_UserEngagement{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">User Engagement Details &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Game_Experience_Details_header_UserEngagement{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Game Experience Details &nbsp;
      </h1>
      </html>
      ;;
  }



  measure:Overview1{
    sql: 1 ;;
    html:
    <html>

            <body>
               <table style="width:100%;height:50%;align:center;font-size:20px;padding-top: 40px;padding-bottom: 20px;" >
                 <tr>
                      <td style="text-align:center;width:200px;padding-top:10px;">
                           <p ><a style="color:#3388ff;cursor: pointer;"class="current" target="_blank" style="font-weight: bold;">
                          <img src="https://www.linkpicture.com/q/eye-2_1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;"/>&ensp;Overview</a>
                           </p>
                     </td>
                      <td style="text-align:center;width:200px;padding-top:10px;">
                          <p><a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black;">
                         <img src="https://www.linkpicture.com/q/stock-exchange-app.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Finance</a>
                          </p>
                      </td>
                     <td  style="text-align:center;width:200px;padding-top:10px;">
                          <p><a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black">
                          <img src="https://www.linkpicture.com/q/users_2.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;User Engagement</a>
                          </p>
                      </td>

                       <td  style="text-align:center;width:200px;padding-top:10px;">
                           <p><a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black">
                           <img src="https://www.linkpicture.com/q/game.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Game Experience</a>
                          </p>
                       </td>

                       <td  style="text-align:center;width:200px;padding-top:10px;">
                           <p><a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"target="_blank" style="color:black">
                           <img src="https://www.linkpicture.com/q/speaker_1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Marketing</a>
                          </p>
                       </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }



  measure:Finance1{
    sql: 1 ;;
    html:
    <html>

                  <body>
                     <table style="width:100%;height:50%;align:center;font-size:20px;padding-left: 30px;padding-top: 20px;padding-bottom: 5px;" >
                       <tr>
                            <td style="text-align:center; width:200px;padding-top:10px;">
                                <p><a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black;">
                               <img src="https://www.linkpicture.com/q/eye_1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Overview</a></p>
                            </td>

                            <td style="text-align:center;width:200px;padding-top:10px;">
                            <p ><a style="color:#3388ff;cursor: pointer;"class="current" target="_blank" style="font-weight: bold;">
                           <img src="https://www.linkpicture.com/q/stock-exchange-app-1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;"/>&ensp;Finance</a>
                            </p>
                           </td>


                           <td  style="text-align:center; width:200px;padding-top:10px;">
                                <p><a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black">
                               <img src="https://www.linkpicture.com/q/users_2.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;User Engagement</a></p>
                            </td>

                           <td  style="text-align:center; width:200px;padding-top:10px;">
                           <p><a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black">
                          <img src="https://www.linkpicture.com/q/game.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Game Experience</a></p>
                           </td>

                            <td  style="text-align:center; width:200px;padding-top:10px;">
                            <p><a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"target="_blank" style="color:black">
                            <img src="https://www.linkpicture.com/q/speaker_1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Marketing</a></p>
                            </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  measure:UserEngagement1{
    sql: 1 ;;
    html:
    <html>

                  <body>
                     <table style="width:100%;height:50%;align:center;font-size:20px;padding-left: 30px;padding-top: 20px;padding-bottom: 5px;" >
                       <tr>
                            <td style="text-align:center; width:200px;padding-top:10px;">
                                <p><a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black;">
                                <img src="https://www.linkpicture.com/q/eye_1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Overview</a></p>
                            </td>

                            <td  style="text-align:center; width:200px;padding-top:10px;">
                                <p><a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black">
                                <img src="https://www.linkpicture.com/q/stock-exchange-app.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Finance</a></p>
                            </td>

                            <td style="text-align:center;width:200px;padding-top:10px;">
                            <p ><a style="color:#3388ff;cursor: pointer;"class="current" target="_blank" style="font-weight: bold;">
                            <img src="https://www.linkpicture.com/q/users-2_1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;"/>&ensp;User Engagement</a>
                            </p>
                           </td>

                           <td  style="text-align:center; width:200px;padding-top:10px;">
                           <p><a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black">
                          <img src="https://www.linkpicture.com/q/game.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Game Experience</a></p>
                           </td>

                            <td  style="text-align:center; width:200px;padding-top:10px;">
                            <p><a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"target="_blank" style="color:black">
                            <img src="https://www.linkpicture.com/q/speaker_1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Marketing</a></p>
                            </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  measure:GameExperience1{
    sql: 1 ;;
    html:
    <html>

                        <body>
                           <table style="width:100%;height:50%;align:center;font-size:20px;padding-left: 30px;padding-top: 20px;padding-bottom: 5px;" >
                             <tr>
                                    <td style="text-align:center; width:200px;padding-top:10px;">
                                      <p><a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black;">
                                      <img src="https://www.linkpicture.com/q/eye_1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Overview</a></p>
                                    </td>

                                    <td  style="text-align:center; width:200px;padding-top:10px;">
                                    <p><a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black">
                                    <img src="https://www.linkpicture.com/q/stock-exchange-app.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Finance</a></p>
                                    </td>

                                    <td  style="text-align:center; width:200px;padding-top:10px;">
                                    <p><a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black">
                                    <img src="https://www.linkpicture.com/q/users_2.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;User Engagement</a></p>
                                    </td>

                                    <td style="text-align:center;width:200px;padding-top:10px;">
                                    <p ><a style="color:#3388ff;cursor: pointer;"class="current" target="_blank" style="font-weight: bold;">
                                    <img src="https://www.linkpicture.com/q/game-3.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;"/>&ensp;Game Experience</a>
                                    </p>
                                    </td>

                                    <td  style="text-align:center; width:200px;padding-top:10px;">
                                    <p><a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"target="_blank" style="color:black">
                                    <img src="https://www.linkpicture.com/q/speaker_1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Marketing</a></p>
                                    </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  measure:Marketing1{
    sql: 1 ;;
    html:
    <html>

                              <body>
                                 <table style="width:100%;height:50%;align:center;font-size:20px;padding-left: 30px;padding-top: 20px;padding-bottom: 5px;" >
                                   <tr>
                                          <td style="text-align:center; width:200px;padding-top:10px;">
                                            <p><a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black;">
                                            <img src="https://www.linkpicture.com/q/eye_1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Overview</a></p>
                                          </td>

                                          <td  style="text-align:center; width:200px;padding-top:10px;">
                                          <p><a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black">
                                          <img src="https://www.linkpicture.com/q/stock-exchange-app.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Finance</a></p>
                                          </td>

                                          <td  style="text-align:center; width:200px;padding-top:10px;">
                                          <p><a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}" target="_blank" style="color:black">
                                          <img src="https://www.linkpicture.com/q/users_2.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;User Engagement</a></p>
                                          </td>


                                          <td  style="text-align:center; width:200px;padding-top:10px;">
                                          <p><a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}&Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"target="_blank" style="color:black">
                                          <img src="https://www.linkpicture.com/q/game.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Game Experience</a></p>
                                          </td>

                                          <td style="text-align:center;width:200px;padding-top:10px;">
                                          <p ><a style="color:#3388ff;cursor: pointer;"class="current" target="_blank" style="font-weight: bold;">
                                          <img src="https://www.linkpicture.com/q/speaker-1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;"/>&ensp;Marketing</a>
                                          </p>
                                          </td>

      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  dimension: Month_String {
    type: string
    sql: ${date__month} ;;
  }




}
