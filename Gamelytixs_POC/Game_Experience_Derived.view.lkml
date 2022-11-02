view: game_experience_derived {

    derived_table: {
      explore_source: ga_dim_date {
        column: api_latency_in_secs { field: ga_game_experience.api_latency_in_secs }
        column: average_clicks_per_screen { field: ga_game_experience.average_clicks_per_screen }
        column: complete_scores { field: ga_game_experience.complete_scores }
        column: country { field: ga_game_experience.country }
        column: crashes { field: ga_game_experience.crashes }
        column: date__date { field: ga_game_experience.date__date }
        column: date__month { field: ga_game_experience.date__month }
        column: date__quarter { field: ga_game_experience.date__quarter }
        column: date__year { field: ga_game_experience.date__year }
        column: date__week { field: ga_game_experience.date__week }
        column: engagement_index_in_per_cent { field: ga_game_experience.engagement_index_in_per_cent }
        column: devices { field: ga_game_experience.devices }
        column: fail_scores { field: ga_game_experience.fail_scores }
        column: game { field: ga_game_experience.game }
        column: level_completes { field: ga_game_experience.level_completes }
        column: level_fails { field: ga_game_experience.level_fails }
        column: level_starts { field: ga_game_experience.level_starts }
        column: level_total_scores { field: ga_game_experience.level_total_scores }
        column: load_time_in_secs { field: ga_game_experience.load_time_in_secs }
        column: platform { field: ga_game_experience.platform }
        column: win_percentage { field: ga_game_experience.win_percentage }

        derived_column: row_no {
          sql: row_number() over(order by country  ) ;;
        }

      }
    }
  dimension: row_no {
    type: number
    primary_key: yes
  }
    dimension: api_latency_in_secs {
      description: ""
      type: number
    }
    dimension: average_clicks_per_screen {
      description: ""
      type: number
    }
    dimension: complete_scores {
      description: ""
      type: number
    }
    dimension: country {
      description: ""
    }
    dimension: crashes {
      description: ""
      type: number
    }

    dimension: date__date {
      description: ""
      type: date
    }
    dimension: date__month {
      description: ""
      type: date_month
    }
    dimension: date__quarter {
      description: ""
      type: date_quarter
    }
    dimension: date__year {
      description: ""
      type: date_year
    }
    dimension: date__week {
      description: ""
      type: date_week
    }
    dimension: engagement_index_in_per_cent {
      description: ""
      type: number
    }
    measure: EI_TM {
      type: average
      sql: ${engagement_index_in_per_cent} ;;
      value_format:  "0.0\%"
      html:
      <p style="font-size:25px;">{{rendered_value}}</p>;;
    }
    dimension: devices {
      description: ""
      type: number
    }
    dimension: fail_scores {
      description: ""
      type: number
    }
    dimension: game {
      description: ""
    }
    dimension: level_completes {
      description: ""
      type: number
    }
    dimension: level_fails {
      description: ""
      type: number
    }
    dimension: level_starts {
      description: ""
      type: number
    }
    dimension: level_total_scores {
      description: ""
      type: number
    }
    dimension: load_time_in_secs {
      description: ""
      type: number
    }
    dimension: platform {
      description: ""
    }
    dimension: win_percentage {
      description: ""
      type: number
    }
  dimension: target {
    type: number
    sql: 45000 ;;
    value_format: "0.0,\" K\""
  }
  dimension: Crashes_Target {
    type: number
    sql: 50;;
    html:
    <p style="font-size:10px;">{{rendered_value}}</p>
    ;;
    #value_format: "Day"
  }
  dimension: Previous_month {
    sql:
     add_months(to_date(${ga_dim_date.date__date},'rr-mm-dd'),-1);;
  }
  # dimension: Previous_Month11 {
  #   sql:
  #   add_months(to_date(substr(${ga_dim_date.date__date},1,10),'rr-mm-rr'),-1);;
  # }
  measure: AVG_Crashes {
    type: average
    sql: ${crashes} ;;
    html:
    <p style="font-size:25px;">{{rendered_value}}</p>;;
  }
  measure: Devices_TM {
    type: sum
    sql: ${devices} ;;
    value_format: "0"
  }

  filter: month_filter1 {
    type: date
    #suggestions: ["01-02-2020"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]

  }
  dimension: Start_Date {
    type: string
    sql: '2020-01-01' ;;

  }

  dimension: End_Date {

    type: string
    sql: case when {% condition month_filter1 %} to_date(${date__date},'yyyy-mm-dd') {% endcondition %} then ${date__date}  end ;;

  }


  # measure: Last12month_Devices {
  #   type: sum
  #   sql:case when ${date__date}>=${Start_Date} and ${date__date}<=${End_Date} then ${devices} end  ;;
  #   value_format: "0"

  # }
  measure: Last12month_Devices {
    type: average
    sql:case when ${date__date}>= ${Start_Date} and to_date(${date__date},'yyyy-mm-dd')< {% date_end month_filter1 %} then 1 else 0 end  ;;
    # value_format: "0.0"
  }
  measure: Last12month_Devices1 {
    type: number
    sql: case when ${Last12month_Devices}=1 then
      sum(${devices}) else null end;;
    value_format: "0"
  }

  measure: Load_Time_TM {
    type: average
    sql: ${load_time_in_secs}+2 ;;
    value_format: "0"
  }

  measure: Load_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then (${load_time_in_secs}+2) end ;;
    value_format: "0"
  }

measure: Load_Time_LM{
    type: average
    sql: CASE WHEN {% condition month_filter %} To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN (${load_time_in_secs}+2) end ;;
    value_format: "0"
  }

  measure: Load_Time_Growth{
    type: number
    sql: ((${Load_selected_month}-${Load_Time_LM})/${Load_Time_LM}) ;;
    value_format: "0.0%"
  }

  measure: API_Latency_Rate {
    type: average
    sql: ${api_latency_in_secs}+1 ;;
    value_format: "0"
  }
  measure: Level_Starts_TM{
    type: sum
    sql: ${level_starts} ;;
    value_format: "0.0,\" K\""
  }

  measure: Level_Starts_This_Month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${level_starts} end ;;
    value_format: "0.0,\" K\""
  }

  measure: Level_Fail_TM{
    type: sum
    sql: ${level_fails} ;;
    value_format: "0.0,\" K\""
  }

  measure: Level_Fail_This_Month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${level_fails}  end ;;
    value_format: "0.0,\" K\""
  }

  measure: Level_Completes_TM{
    type: sum
    sql: ${level_completes} ;;
    value_format: "0.0,\" K\""
  }

  measure: Level_Completes_This_Month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${level_completes}  end ;;
    value_format: "0.0,\" K\""
  }

  measure: AVG_Clicks_TM {
    type: average
    sql: ${average_clicks_per_screen} ;;
    value_format: "0"
  }
  measure: Level_Fail_Scores_TM {
    type: average
    sql: ${fail_scores} ;;
    value_format: "0"
  }
  measure: Level_Complete_Scores_TM {
    type: average
    sql: ${complete_scores} ;;
    value_format: "0"
  }
  measure: Win_Percentage_TM {
    type: average
    sql: ${win_percentage} ;;
    value_format: "0\%"
  }
  filter: month_filter {
    type: string
    #suggestions: ["01-02-2020"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]

  }
  measure: Crashes_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${crashes} end ;;
    value_format: "0"
  }
  measure: crashes_Last_Month{
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${crashes} end ;;

  }
  measure: Crashes_Growth{
    type: number
    sql: ((${Crashes_selected_month}-${crashes_Last_Month})/${crashes_Last_Month}) ;;
    html: {% if value >0 %}
    <p style="color: green; margin: 0;  text-align:center">{{rendered_value }}</p>
    {% else %}
    <p style="color: red;  margin: 0;  text-align:center">{{rendered_value }}</p>
    {% endif %} ;;
    value_format: "0.0%"
    }
  measure: EI_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${engagement_index_in_per_cent} end ;;
    value_format: "0.0\%"
  }
  measure: EI_Last_Month{
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${engagement_index_in_per_cent} end ;;
   value_format: "0.0\%"

  }
  measure: EI_Growth{
    type: number
    sql: ((${EI_selected_month}-${EI_Last_Month})/${EI_Last_Month}) ;;
    html:

    {% if value >= 0 %}

    <font color="green">{{ rendered_value }}</font>

    {% else %}

    <font color="red">{{ rendered_value }}</font>

    {% endif %}

    ;;
     value_format: "0.0%"
  }


  measure: devices_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${devices} end ;;
    value_format: "0.0,\" K\""
  }

  measure: devices_LM_pr{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${devices} end ;;
    value_format: "0.0,\" K\""
  }


  measure: Devices_Growth{
    type: number
    sql: ((${devices_selected_month}-${devices_LM_pr})/nullif(${devices_LM_pr},0)) ;;
    value_format: "0.0%"
  }

  measure: Avg_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${average_clicks_per_screen} end ;;
    value_format: "0"
  }
  measure: Avg_Last_Month{
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${average_clicks_per_screen} end ;;
    value_format: "0"

  }
  measure: Avg_Clicks_Growth{
    type: number
    sql: ((${Avg_selected_month}-${Avg_Last_Month})/${Avg_Last_Month}) ;;
    value_format: "0.0%"
  }

  measure: Level_Fail_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${fail_scores} end ;;
    value_format: "0"
  }
  measure: Level_Fail_Scores_Last_Month{
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${fail_scores} end ;;
   value_format: "0"

  }
  measure: Level_Fail_Scores_Growth{
    type: number
    sql: ((${Level_Fail_selected_month}-${Level_Fail_Scores_Last_Month})/${Level_Fail_Scores_Last_Month}) ;;
    value_format: "0.0%"
    #value_format_name: percent_1
  }

  measure: Level_Complete_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${complete_scores} end ;;
    value_format: "0"
  }
  measure: Level_Complete_Scores_Last_Month{
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${complete_scores} end ;;
    value_format: "0"

  }
  measure: Level_Complete_Scores_Growth{
    type: number
    sql: ((${Level_Complete_selected_month}-${Level_Complete_Scores_Last_Month})/${Level_Complete_Scores_Last_Month}) ;;
    value_format: "0.0%"
  }

  measure: Win_Percentage_selected_month {
    type: average
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${win_percentage} end ;;
    value_format: "0.0\%"
  }
  measure: Win_Percentage_Last_Month{
    type: average
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${win_percentage} end ;;
    value_format: "0.0\%"

  }
  measure: Win_Percentage_Growth{
    type: number
    sql: ((${Win_Percentage_selected_month}-${Win_Percentage_Last_Month})/${Win_Percentage_Last_Month}) ;;
    value_format: "0.0%"
  }

  dimension: header{
    sql: 1 ;;
    html:
    <html>
    <body>
   <div style="color:#000000;background-color:#f5f5f5  ;font-size: 10pt; margin:1.5px auto;text-align:center;
    padding: 1.5px 5px;margin:0;border-radius: 2.5px;height: 30px;">
    <nav style="font-size: 18px;">

    <a href="https://thirdi.looker.com/dashboards/149?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}
    &Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"
    style="padding: 1.5px 8px; float: left; line-height: 15px;">Overview </a>&emsp;&emsp;

    <a href="https://thirdi.looker.com/dashboards/150?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}
    &Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"
    style="padding: 1.5px 8px; float: left; line-height: 15px;">Finance </a>&emsp;&emsp;

    <a href="https://thirdi.looker.com/dashboards/151?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}
      &Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"
    style="padding: 1.5px 8px; float: left; line-height: 15px;">User Engagement </a>&emsp;&emsp;

    <a href="https://thirdi.looker.com/dashboards/152?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}
    &Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"
    style="padding: 1.5px 8px; float: left; line-height: 15px;"><b>Game Experience </b></a>&emsp;&emsp;

    <a href="https://thirdi.looker.com/dashboards/154?Month={{ _filters['ga_dim_date.date__month'] | url_encode }}&Country={{ _filters['ga_dim_country.country'] | url_encode }}
   &Platform={{ _filters['ga_dim_platform.platform'] | url_encode }}&Game={{ _filters['ga_dim_game.game'] | url_encode }}"
    style="padding: 1.5px 8px; float: left; line-height: 15px;">Marketing </a>&emsp;&emsp;
    </nav>
    </div>
    </body>
    </html>;;
  }




  measure:Overview_GameExperience_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:center;width:200px;padding-top: 15px;font-size:13px;">
      CRASHES<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{game_experience_derived.Crashes_selected_month._rendered_value}}</b>

      </td>
      <td style="text-align:center;width:200px;padding-top: 15px;font-size:13px;">
     ENGAGEMENT&nbsp;INDEX<br style="line-height:1.5;"><b style="font-size:29.5px;">{{game_experience_derived.EI_selected_month._rendered_value}}</b>

      </td>
     </tr>

      <tr>
      <td style="text-align:center; line-height:1.0;width:200px;font-size:13px;">
      <p>
      {% if game_experience_derived.Crashes_Growth._value >= 0 %}

     <font color="green"> ▲ {{ game_experience_derived.Crashes_Growth._rendered_value }}</font>&nbsp; LM

       {% else %}

     <font color="red"> ▼  {{ game_experience_derived.Crashes_Growth._rendered_value }}</font>&nbsp; LM

    {% endif %}

      </p>
      </td>

       <td style="text-align:center; line-height:1.0;width:200px;font-size:13px;">
      <p>
      {% if game_experience_derived.EI_Growth._value >= 0 %}

     <font color="green"> ▲ {{ game_experience_derived.EI_Growth._rendered_value }}</font>&nbsp; LM

       {% else %}

     <font color="red"> ▼  {{ game_experience_derived.EI_Growth._rendered_value }}</font>&nbsp; LM

    {% endif %}

      </p>
      </td>


      </tr>
      </table>



      </body>
      </html>
      ;;
  }

  measure:Game_Experience_DEVICES_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height:1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 10px;font-size:13px;padding-left:10px;">
      DEVICES<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{game_experience_derived.devices_selected_month._rendered_value}}</b>
     </td>
      <td style="text-align:center;width:200px;padding-top: 40px;font-size:14px;padding-left:55px;">
      Target<br style="line-height:1.5;"><b style="font-size:15px;">
      {{ game_experience_derived.target._rendered_value }}
      </b>
      </td>
     </tr>

      <tr>
      <td style="text-align:LEFT; line-height:1.5;width:200px;font-size:13px;padding-left:10px;">

      {% if game_experience_derived.Devices_Growth._value >= 0 %}

      <font color="green"> ▲ {{ game_experience_derived.Devices_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ game_experience_derived.Devices_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>

      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  measure:Game_Experience_AVG_LOAD_TIME_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height:1.5;align:center;font-size:13px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top:10px;font-size:13px;padding-left:10px;">
      AVG.&nbsp;LOAD&nbsp;TIME<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{game_experience_derived.Load_selected_month._rendered_value}}</b>&nbsp;Sec

      </td>
      <td style="text-align:center;width:200px;padding-top: 40px;font-size:14px;padding-left:55px;">
      API&nbsp;Latency<br style="line-height:1.5;"><b style="font-size:15px;">
       {{ game_experience_derived.API_Latency_Rate._rendered_value }}
      </b>
      </td>
     </tr>

      <tr>
      <td style="text-align:LEFT; line-height:1.5;width:200px;font-size:13px;padding-left:10px;">

      {% if game_experience_derived.Load_Time_Growth._value >= 0 %}

      <font color="green"> ▲ {{ game_experience_derived.Load_Time_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ game_experience_derived.Load_Time_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>

      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  measure:Game_Experience_CRASHES_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height:1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top:10px;font-size:13px;padding-left:10px;">
      CRASHES<br style="line-height:1.5;"><b style="font-size:34px; ">{{game_experience_derived.Crashes_selected_month._rendered_value}}</b>&nbsp;/ Day
      </td>
      <td style="text-align:center;width:200px;padding-top: 40px;font-size:14px;padding-left:55px;">
      Target<br style="line-height:1.5;"><b style="font-size:15px;">
       {{ game_experience_derived.Crashes_Target._rendered_value }}&nbsp;/ Day
      </b>
      </td>
     </tr>

      <tr>
      <td style="text-align:LEFT; line-height:1.5;width:200px;font-size:13px;padding-left:10px;">

      {% if game_experience_derived.Crashes_Growth._value >= 0 %}

      <font color="green"> ▲ {{ game_experience_derived.Crashes_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ game_experience_derived.Crashes_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>

      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  measure:Game_Experience_Engagement_Index_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height:1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top:10px;font-size:13px;padding-left:10px;">
       ENGAGEMENT&nbsp;INDEX<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{game_experience_derived.EI_selected_month._rendered_value}}</b>

      </td>
      <td style="text-align:center;width:200px;padding-top: 40px;font-size:14px;padding-left:55px;">
       Target<br style="line-height:1.5;"><b style="font-size:15px;">
           {{ ga_finance.Target2._rendered_value }}
      </b>
      </td>
     </tr>

      <tr>
      <td style="text-align:LEFT; line-height:1.5;width:200px;font-size:13px;padding-left:10px;">
      <p>
      {% if game_experience_derived.EI_Growth._value >= 0 %}

      <font color="green"> ▲ {{ game_experience_derived.EI_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ game_experience_derived.EI_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>
      </td>

      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  measure:GameExperience_AvgCLicks_Screen_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;padding-left:5px;">
      <p >AVG.&nbsp;CLICKS / SCREEN<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{game_experience_derived.Avg_selected_month._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:center;width:200px;padding-top: 35px;padding-left:25px;font-size:13px;">
      <p>
      {% if game_experience_derived.Avg_Clicks_Growth._value >= 0 %}

      <font color="green"> ▲ {{ game_experience_derived.Avg_Clicks_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ game_experience_derived.Avg_Clicks_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>

      </p>
      </td>
      </tr>


      </table>

      </body>
      </html>
      ;;
  }

  measure:GameExperience_WinPercent_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;padding-left:5px;">
      <p >WIN&nbsp;PERCENTAGE<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{game_experience_derived.Win_Percentage_selected_month._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:center;width:200px;padding-top:35px;padding-left:30px;font-size:13px;">
      <p>
      {% if game_experience_derived.Win_Percentage_Growth._value >= 0 %}

      <font color="green"> ▲ {{ game_experience_derived.Win_Percentage_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ game_experience_derived.Win_Percentage_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>

      </p>
      </td>
      </tr>


      </table>

      </body>
      </html>
      ;;
  }

  measure:GameExperience_Level_Statistics_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;padding-left:4px;">
      <p >LVL&nbsp;STATISTICS<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{game_experience_derived.Level_Starts_This_Month._rendered_value}}</b><br style="line-height:1.5;">&nbsp;Start
      </p>
      </td>
       <td style="text-align:left;width:200px;padding-top: 15px;font-size:14px;padding-left:4px;">
      <p ><br style="line-height:1.5;"><b style="font-size:29.5px; ">&ensp;{{game_experience_derived.Level_Fail_This_Month._rendered_value}}</b><br style="line-height:1.5;">&emsp;&ensp;Fail
      </p>
      </td>
       <td style="text-align:center;width:200px;padding-top: 15px;font-size:14px;padding-left:12px;">
      <p ><br style="line-height:1.5;"><b style="font-size:29.5px; ">{{game_experience_derived.Level_Completes_This_Month._rendered_value}}</b><br style="line-height:1.5;">Complete
      </p>
      </td>
      </tr>


      </table>

      </body>
      </html>
      ;;
  }

  measure:Game_Experience_AVG_LEVEL_SCORES_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.0;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr style="line-height:1.0">

      <td style="text-align:LEFT; line-height:1.0;width:200px;font-size:13px;">AVG.&nbsp;LVL <br> SCORES
      </td>
      </tr>
      <tr>
      <td style="text-align:left;width:200px;line-height:1.0;padding-top: 30px;font-size:14px;padding-left:5px;Padding-top:30px;">
      <p ><b style="font-size:29.5px; ">{{game_experience_derived.Level_Fail_selected_month._rendered_value}}</b><br style="line-height:1.5;">Fail
      </p>
      </td>
      <td style="text-align:LEFT; width:200px;font-size:13px;padding-top:30px;">
      <p>
      {% if game_experience_derived.Level_Fail_Scores_Growth._value >= 0 %}

      <font color="green"> ▲ {{ game_experience_derived.Level_Fail_Scores_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ game_experience_derived.Level_Fail_Scores_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>
      </td>

       <td style="text-align:center; line-height:1.0;width:200px;font-size:14px;Padding-top:10px;">
      <p><br style="line-height:1.5;"><b style="font-size:29.5px; ">
      {{ game_experience_derived.Level_Complete_selected_month._rendered_value }}<br style="line-height:1.5;"></b>Complete
      </p>
      </td>
      <td style="text-align:right; line-height:1.0;width:200px;font-size:13px;padding-top:30px;">
      <p>
      {% if game_experience_derived.Level_Complete_Scores_Growth._value >= 0 %}

      <font color="green"> ▲ {{ game_experience_derived.Level_Complete_Scores_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ game_experience_derived.Level_Complete_Scores_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>
      </td>
      </tr>

      </table>

      </body>
      </html>
      ;;
  }




}
