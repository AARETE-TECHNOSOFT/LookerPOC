# The name of this view in Looker is "Ga Churn Rate Causes"
view: ga_churn_rate_causes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".GA_CHURN_RATE_CAUSES
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Churn Numbers" in Explore.

  dimension: churn_numbers {
    primary_key: yes
    type: number
    sql: ${TABLE}.CHURN_NUMBERS ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_churn_numbers {
    type: sum
    sql: ${churn_numbers} ;;
    value_format: "0.0\%"
  }

  measure: average_churn_numbers {
    type: average
    sql: ${churn_numbers} ;;
  }

  dimension: churn_rate_causes {
    type: string
    sql: ${TABLE}.CHURN_RATE_CAUSES ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

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
  }

  dimension: game {
    type: string
    sql: ${TABLE}.GAME ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.PLATFORM ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: Total_Uninstalls {
    type: sum
    sql: ${churn_numbers} ;;
    value_format: "0.0,\" K\""
    html:
    <p style="font-size:25px;">{{rendered_value}}</p>;;
  }
  measure: Uninstall_AM1 {
    hidden: yes
    type: sum
    sql: ${churn_numbers} ;;
    filters: [churn_rate_causes: "Abusive In-Game Messages"]
    value_format: "0.0,\" K\""
  }
  measure: AM_Percent_Total1 {
    type: number
    sql: case when ${Uninstall_AM1}=0 then 0 else ${Uninstall_AM1}/${Total_Uninstalls} end ;;
    value_format: "0.0%"
    # html:
    # <li style="color:#265780;">
    # {{rendered_value}}
    # </li>
    # ;;
  }
  measure: Uninstall_AM2 {
    hidden: yes
    type: sum
    sql: ${churn_numbers} ;;
    filters: [churn_rate_causes: "High Latency"]
    value_format: "0.0,\" K\""
  }
  measure: AM_Percent_Total2 {
    type: number
    sql: case when ${Uninstall_AM2}=0 then 0 else ${Uninstall_AM2}/${Total_Uninstalls} end ;;
    value_format: "0.0%"
  }

  measure: Uninstall_AM3 {
    hidden: yes
    type: sum
    sql: ${churn_numbers} ;;
    filters: [churn_rate_causes: "Poor Gameplay Balance"]
    value_format: "0.0,\" K\""
  }
  measure: AM_Percent_Total3 {
    type: number
    sql: case when ${Uninstall_AM3}=0 then 0 else ${Uninstall_AM3}/${Total_Uninstalls} end ;;
    value_format: "0.0%"
  }
  measure: Uninstall_AM4 {
    hidden: yes
    type: sum
    sql: ${churn_numbers} ;;
    filters: [churn_rate_causes: "Exhaustive Updates"]
    value_format: "0.0,\" K\""
  }
  measure: AM_Percent_Total4 {
    type: number
    sql: case when ${Uninstall_AM4}=0 then 0 else ${Uninstall_AM4}/${Total_Uninstalls} end ;;
    value_format: "0.0%"
  }
  measure: Uninstall_AM5 {
    hidden: yes
    type: sum
    sql: ${churn_numbers} ;;
    filters: [churn_rate_causes: "Disengaging Tutorial"]
    value_format: "0.0,\" K\""
  }
  measure: AM_Percent_Total5 {
    type: number
    sql: case when ${Uninstall_AM5}=0 then 0 else ${Uninstall_AM5}/${Total_Uninstalls} end ;;
    value_format: "0.0%"
  }
  filter: month_filter {
    type: string
    #suggestions: ["01-02-2020"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]

  }
  measure: Uninstalls_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${churn_numbers} end ;;
   value_format: "0.0,\" K\""
  }
  measure: Uninstalls_last_month{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${churn_numbers} end ;;
     value_format: "0.0,\" K\""
  }
  measure:Uninstalls_Growth{
    type: number
    sql: ((${Uninstalls_selected_month}-${Uninstalls_last_month})/nullif(${Uninstalls_last_month},0)) ;;
    value_format: "0.0%"
    }

  measure:User_Engagement_Churn_Rate_Causes_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >

      <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;">
       <p ><font color="#265780">● &ensp;</font>ABUSIVE IN-GAME MESSAGES<br style="line-height:1.5;"><b style="font-size:18px; ">{{ga_churn_rate_causes.AM_Percent_Total1._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;">
      <p ><font color="#33992E">● &ensp;</font>HIGH&ensp;LATENCY<br style="line-height:1.5;"><b style="font-size:18px;">{{ga_churn_rate_causes.AM_Percent_Total2._rendered_value}}</b>
      </p>
      </td>
     </tr>
      <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;">
      <p ><font color="#E5C877">● &ensp;</font>POOR&ensp;GAMEPLAY&ensp;BALANCE<br style="line-height:1.5;"><b style="font-size:18px; ">{{ga_churn_rate_causes.AM_Percent_Total3._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;">
      <p ><font color="#62bad4">● &ensp;</font>EXHAUSTIVE&ensp;UPDATES<br style="line-height:1.5;"><b style="font-size:18px;">{{ga_churn_rate_causes.AM_Percent_Total4._rendered_value}}</b>
      </p>
      </td>
      <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:13px;">
      <p ><font color="#EE7772">● &ensp;</font>DISENGAGING&ensp;TUTORIAL<br style="line-height:1.5;"><b style="font-size:18px;">{{ga_churn_rate_causes.AM_Percent_Total5._rendered_value}}</b>
      </p>
      </td>
      </tr>
      </table>
      </body>
      </html>
      ;;
  }

}
