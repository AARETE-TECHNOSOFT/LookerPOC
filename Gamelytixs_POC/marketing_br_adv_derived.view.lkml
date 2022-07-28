view: marketing_br_adv_derived {

    derived_table: {
      explore_source: ga_dim_date {
        column: youtube_reach { field: ga_marketing_br_adv_analysis.youtube_reach }
        column: age_10_14 { field: ga_marketing_br_adv_analysis.age_10_14 }
        column: age_15_19 { field: ga_marketing_br_adv_analysis.age_15_19 }
        column: age_20_24 { field: ga_marketing_br_adv_analysis.age_20_24 }
        column: age_25_30 { field: ga_marketing_br_adv_analysis.age_25_30 }
        column: age_30_ { field: ga_marketing_br_adv_analysis.age_30_ }
        column: appstore { field: ga_marketing_br_adv_analysis.appstore }
        column: cohort_a { field: ga_marketing_br_adv_analysis.cohort_a }
        column: cohort_b { field: ga_marketing_br_adv_analysis.cohort_b }
        column: country { field: ga_marketing_br_adv_analysis.country }
        column: date__date { field: ga_marketing_br_adv_analysis.date__date }
        column: date__month { field: ga_marketing_br_adv_analysis.date__month }
        column: date__quarter { field: ga_marketing_br_adv_analysis.date__quarter }
        column: date__week { field: ga_marketing_br_adv_analysis.date__week }
        column: date__year { field: ga_marketing_br_adv_analysis.date__year }
        column: facebook_reach { field: ga_marketing_br_adv_analysis.facebook_reach }
        column: game { field: ga_marketing_br_adv_analysis.game }
        column: instagram_reach { field: ga_marketing_br_adv_analysis.instagram_reach }
        column: microsoft_store { field: ga_marketing_br_adv_analysis.microsoft_store }
        column: other_channels_reach { field: ga_marketing_br_adv_analysis.other_channels_reach }
        column: platform { field: ga_marketing_br_adv_analysis.platform }
        column: playstore { field: ga_marketing_br_adv_analysis.playstore }
        derived_column: row_no {
          sql: row_number() over(order by date__date desc ) ;;
        }
      }
    }
  dimension: row_no {
    type: number
    primary_key: yes
  }
    dimension: youtube_reach {
      description: ""
      type: number
    }
    dimension: age_10_14 {
      description: ""
      type: number
    }
    dimension: age_15_19 {
      description: ""
      type: number
    }
    dimension: age_20_24 {
      description: ""
      type: number
    }
    dimension: age_25_30 {
      description: ""
      type: number
    }
    dimension: age_30_ {
      description: ""
      type: number
    }
    dimension: appstore {
      description: ""
      type: number
    }
    dimension: cohort_a {
      description: ""
      type: number
    }
    dimension: cohort_b {
      description: ""
      type: number
    }
    dimension: country {
      description: ""
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
    dimension: date__week {
      description: ""
      type: date_week
    }
    dimension: date__year {
      description: ""
      type: date_year
    }
    dimension: facebook_reach {
      description: ""
      type: number
    }

    dimension: game {
      description: ""
    }
    dimension: instagram_reach {
      description: ""
      type: number
    }
    dimension: microsoft_store {
      description: ""
      type: number
    }
    dimension: other_channels_reach {
      description: ""
      type: number
    }

    dimension: platform {
      description: ""
    }
    dimension: playstore {
      description: ""
      type: number
    }
  dimension: target {
    type: number
    sql: 80000 ;;
  }
    measure: YT_Reach_TM {
      type: sum
      sql: ${youtube_reach} ;;
      value_format: "0.0,\" K\""
      html:
      <p style="font-size:25px;">
      <img src="https://img.icons8.com/color/48/000000/youtube-play.png" width="35" height="35"/>&nbsp;{{rendered_value}}</p>

      ;;
    }
    measure: Insta_Reach_TM {
      type: sum
      sql: ${instagram_reach} ;;
      value_format: "0.0,\" K\""
      html:
      <p style="font-size:25px;">
    <img src="https://img.icons8.com/fluency/48/000000/instagram-new.png" width="35" height="35"/>&nbsp;{{rendered_value}}</p>

      ;;
    }
    measure: FB_Reach_TM {
      type: sum
      sql: ${facebook_reach} ;;
      value_format: "0.0,\" K\""
      html:
      <p style="font-size:25px;">
    <img src="https://img.icons8.com/color/48/000000/facebook-circled--v1.png" width="35" height="35"/>&nbsp;{{rendered_value}}</p>

      ;;
    }
    measure: Other_Reach_TM {
      type: sum
      sql: ${other_channels_reach} ;;
      value_format: "0.0,\" K\""
    }

    measure: Total_Reach_TM {
      type: number
      sql: sum(${Insta_Reach_TM},${YT_Reach_TM},${FB_Reach_TM},${Other_Reach_TM}) ;;
      value_format: "0.0,\" K\""
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

  measure: Cohort_A_Last12months  {
    type: number
    sql: case when ${Last12month}=1 then
      sum(${TABLE}.COHORT_A) else null end;;
    value_format: "0.00"
  }

  measure: Cohort_B_Last12months  {
    type: number
    sql: case when ${Last12month}=1 then
      sum(${TABLE}.COHORT_B) else null end;;
    value_format: "0.00"
  }


  measure: Last12month
  {
    type: average
    sql:case when ${date__date}>= ${Start_Date} and to_date(${date__date},'yyyy-mm-dd')< {% date_end month_filter1 %} then 1 else 0 end  ;;
  }


  # measure: Last12monthFBReach {
  #   type: sum
  #   sql:case when ${date__date}>=${Start_Date} and ${date__date}<=${End_Date} then ${facebook_reach} end  ;;
  #   value_format: "0"

  # }
  measure: Last12monthFBReach {
    type: average
    sql:case when ${date__date}>= ${Start_Date} and to_date(${date__date},'yyyy-mm-dd')< {% date_end month_filter1 %} then 1 else 0 end  ;;
    # value_format: "0.0"
  }
  measure: Last12monthFBReach1 {
    type: number
    sql: case when ${Last12monthFBReach}=1 then
      sum(${facebook_reach}) else null end;;
    value_format: "0.0"
  }
  # measure: Last12monthInstaReach {
  #   type: average
  #   sql:case when ${date__date}>= ${Start_Date} and to_date(${date__date},'yyyy-mm-dd')< {% date_end month_filter1 %} then 1 else 0 end  ;;
  #   # value_format: "0.0"
  # }
  measure: Last12monthInstaReach1 {
    type: number
    sql: case when ${Last12monthFBReach}=1 then
      sum(${instagram_reach}) else null end;;
    value_format: "0.0"
  }
  # measure: Last12monthInstaReach {
  #   type: sum
  #   sql:case when ${date__date}>=${Start_Date} and ${date__date}<=${End_Date} then ${instagram_reach} end  ;;
  #   value_format: "0"

  # }
  # measure: Last12monthYTReach {
  #   type: average
  #   sql:case when ${date__date}>= ${Start_Date} and to_date(${date__date},'yyyy-mm-dd')< {% date_end month_filter1 %} then 1 else 0 end  ;;
  #   # value_format: "0.0"
  # }
  measure: Last12monthYTReach1 {
    type: number
    sql: case when ${Last12monthFBReach}=1 then
      sum(${youtube_reach}) else null end;;
    value_format: "0.0"
  }
  # measure: Last12monthYTReach {
  #   type: sum
  #   sql:case when ${date__date}>=${Start_Date} and ${date__date}<=${End_Date} then ${youtube_reach} end  ;;
  #   value_format: "0"

  # }
  # measure: Last12monthOtherReach {
  #   type: average
  #   sql:case when ${date__date}>= ${Start_Date} and to_date(${date__date},'yyyy-mm-dd')< {% date_end month_filter1 %} then 1 else 0 end  ;;
  #   # value_format: "0.0"
  # }
  measure: Last12monthOtherReach1 {
    type: number
    sql: case when ${Last12monthFBReach}=1 then
      sum(${other_channels_reach}) else null end;;
    value_format: "0.0"
  }
  # measure: Last12monthOtherReach {
  #   type: sum
  #   sql:case when ${date__date}>=${Start_Date} and ${date__date}<=${End_Date} then ${other_channels_reach} end  ;;
  #   value_format: "0"

  # }

  measure: K_Factor_Target {
    type: number
    sql: 0.60 ;;
    value_format: "0.0%"
  }

  measure: Conversion_Rate_Target {
    type: number
    sql: 0.05 ;;
    value_format: "0.0%"
  }

  measure: Retention_Rate_Target {
    type: number
    sql: 0.70;;
    value_format: "0.0%"
  }

  measure: PlayStore_Ranking_TM {
    type: average
    sql: ${playstore} ;;
  }

  measure: AppStore_Ranking_TM {
    type: average
    sql: ${appstore} ;;
  }

  measure: MicrosoftStore_Ranking_TM {
    type: average
    sql: ${microsoft_store};;
  }

  measure: Age_10_14_sum {
    type: sum
    sql: ${age_10_14} ;;
    value_format: "0.00"
  }

  measure: Age_15_19_sum {
    type: sum
    sql: ${age_15_19};;
    value_format: "0.00"
  }

  measure: Age_20_24_sum {
    type: sum
    sql: ${age_20_24};;
    value_format: "0.00"
  }

  measure: Age_25_30_sum {
    type: sum
    sql: ${age_25_30} ;;
    value_format: "0.00"
  }

  measure: Age_30_plus_sum {
    type: sum
    sql: ${age_30_} ;;
    value_format: "0.00"
  }

  measure: Cohort_A_sum {
    type: sum
    sql: ${TABLE}.COHORT_A ;;
    value_format: "0.00"
 }

  measure: Cohort_B_sum {
    type: sum
    sql: ${TABLE}.COHORT_B ;;
    value_format: "0.00"
  }
  filter: month_filter {
    type: string
    #suggestions: ["01-02-2020"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]

  }
  measure: YTReach_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${youtube_reach} end ;;
    value_format: "0.0,\" K\""
  }
  measure: InstaReach_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${instagram_reach}end ;;
    value_format: "0.0,\" K\""
  }
  measure: FBReach_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${facebook_reach}end ;;
    value_format: "0.0,\" K\""
  }
  measure: OtherReach_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${other_channels_reach}end ;;
    value_format: "0.0,\" K\""
  }
  measure: Total_Reach_selectedMonth {
    type: number
    sql: (${YTReach_selected_month}+${InstaReach_selected_month}+${FBReach_selected_month}+${OtherReach_selected_month});;
    value_format: "0.0,\" K\""
  }
  measure: YTReach_LM{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${youtube_reach} end ;;
    value_format: "0.0,\" K\""
  }
  measure: InstaReach_LM{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${instagram_reach} end ;;
    value_format: "0.0,\" K\""
  }
  measure: FBReach_LM{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${facebook_reach} end ;;
    value_format: "0.0,\" K\""
  }
  measure: OtherReach_LM{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${other_channels_reach} end ;;
    value_format: "0.0,\" K\""
  }
  measure: Total_Reach_LastMonth {
    type: number
    sql: (${YTReach_LM}+${InstaReach_LM}+${FBReach_LM}+${OtherReach_LM});;
    value_format: "0.0,\" K\""
  }
  measure: TotalReach_Growth{
    type: number
    sql: ((${Total_Reach_selectedMonth}-${Total_Reach_LastMonth})/nullif(${Total_Reach_LastMonth},0)) ;;
    value_format: "0.0%"
  }

  measure: Age_10_14_Last12months {
    type: number
    sql:case when ${Last12month}=1 then
      sum(${age_10_14}) else null end;;
    value_format: "0.00"
  }

  measure: Age_15_19_Last12months {
    type: number
    sql:case when ${Last12month}=1 then
      sum(${age_15_19}) else null end;;
    value_format: "0.00"
  }

  measure: Age_20_24_Last12months{
    type: number
    sql:case when ${Last12month}=1 then
      sum(${age_20_24}) else null end;;
    value_format: "0.00"
  }

  measure: Age_25_30_Last12months{
    type: number
    sql:case when ${Last12month}=1 then
      sum(${age_25_30} ) else null end;;
    value_format: "0.00"
  }

  measure: Age_30_plus_Last12months {
    type: number
    sql:case when ${Last12month}=1 then
      sum(${age_30_}) else null end;;
    value_format: "0.00"
  }

  measure:Overview_Marketing_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
      <tr>
      <td style="text-align:center;width:200px;font-size: 9pt;">
      TOTAL&nbsp;REACH<br style="line-height:1.0;font-size: 8pt;"><b style="font-size:29.5px; ">{{marketing_br_adv_derived.Total_Reach_selectedMonth._rendered_value}}</b>

      </td>
      <td style="text-align:center;width:150px;">
      <br style="line-height:1.0;">
      <img src="https://img.icons8.com/color/48/000000/facebook-circled--v1.png" width="25" height="25"/>

      </td>
       </td>
      <td style="text-align:center;width:150px;">
      <br style="line-height:1.0;">
      <img src="https://img.icons8.com/color/48/000000/youtube-play.png" width="25" height="25"/>

      </td>
       </td>
      <td style="text-align:center;width:150px;">
      <br style="line-height:1.0;">
      <img src="https://img.icons8.com/fluency/48/000000/instagram-new.png" width="25" height="25"/>

      </td>
       </td>

     </tr>

      <tr>
      <td style="text-align:center; width:200px;font-size:13px;">

      {% if marketing_br_adv_derived.TotalReach_Growth._value >= 0 %}

     <font color="green"> ▲ {{ marketing_br_adv_derived.TotalReach_Growth._rendered_value }}</font>&nbsp; LM

       {% else %}

     <font color="red"> ▼  {{ marketing_br_adv_derived.TotalReach_Growth._rendered_value }}</font>&nbsp; LM

    {% endif %}

      </td>
       <td style="text-align:center;width:200px;font-size:13px;">
     {{marketing_br_adv_derived.FBReach_selected_month._rendered_value}}

      </td>
       </td>
      <td style="text-align:center;width:200px;font-size:13px;">
      {{marketing_br_adv_derived.YTReach_selected_month._rendered_value}}

      </td>
       </td>
      <td style="text-align:center;width:200px;font-size:13px;">
      {{marketing_br_adv_derived.InstaReach_selected_month._rendered_value}}

      </td>
       </td>
      </tr>
      </table>
      </body>
      </html>
      ;;
  }


  measure:Marketing_Brand_Reach_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height:1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >
     <tr>
      <td style="text-align:LEFT;width:200px;font-size: 13pt;padding-left:10px;padding-top:10px;">
      <font style="font-size:10pt;">BRAND&nbsp;REACH</font><br style="line-height:1.5;font-size:10px;"><b style="font-size:29.5px;">{{marketing_br_adv_derived.Total_Reach_selectedMonth._rendered_value}}</b>

      </td>
      <td style="text-align:center;width:200px;font-size: 13pt;">
      <br style="line-height:1.0;">
      <img src="https://img.icons8.com/color/48/000000/facebook-circled--v1.png" width="25" height="25"/>

      </td>
       </td>
      <td style="text-align:center;width:200px;font-size: 13pt;">
      <br style="line-height:1.0;">
      <img src="https://img.icons8.com/color/48/000000/youtube-play.png" width="25" height="25"/>

      </td>
       </td>
      <td style="text-align:center;width:200px;font-size: 13pt;">
      <br style="line-height:1.0;">
      <img src="https://img.icons8.com/fluency/48/000000/instagram-new.png" width="25" height="25"/>

      </td>
       </td>

      </tr>

      <tr>
      <td style="text-align:LEFT; width:200px;font-size: 10pt;padding-left:15px;">
      <p>
      {% if marketing_br_adv_derived.TotalReach_Growth._value >= 0 %}

      <font color="green"> ▲ {{ marketing_br_adv_derived.TotalReach_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ marketing_br_adv_derived.TotalReach_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}
      </p>
      </td>
      <td style="text-align:center;width:200px;font-size: 10pt;">
      <p >{{marketing_br_adv_derived.FBReach_selected_month._rendered_value}}
      </p>
      </td>
      </td>
      <td style="text-align:center;width:200px;font-size: 10pt;">
      <p >{{marketing_br_adv_derived.YTReach_selected_month._rendered_value}}
      </p>
      </td>
      </td>
      <td style="text-align:center;width:200px;font-size: 10pt;">
      <p >{{marketing_br_adv_derived.InstaReach_selected_month._rendered_value}}
      </p>
      </td>
      </td>
      </tr>
      </table>
      </body>
      </html>
      ;;
  }






  }
