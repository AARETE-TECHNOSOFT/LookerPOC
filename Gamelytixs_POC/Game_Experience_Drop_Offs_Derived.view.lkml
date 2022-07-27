view: game_experience_drop_offs_derived {

    derived_table: {
      explore_source: ga_dim_date {
        column: country { field: ga_game_experience_drop_offs.country }
        column: date__date { field: ga_game_experience_drop_offs.date__date }
        column: date__month { field: ga_game_experience_drop_offs.date__month }
        column: date__quarter { field: ga_game_experience_drop_offs.date__quarter }
        column: date__week { field: ga_game_experience_drop_offs.date__week }
        column: date__year { field: ga_game_experience_drop_offs.date__year }
        column: drop_off_causes { field: ga_game_experience_drop_offs.drop_off_causes }
        column: game { field: ga_game_experience_drop_offs.game }
        column: game_drop_offs_count { field: ga_game_experience_drop_offs.game_drop_offs_count }
        column: platform { field: ga_game_experience_drop_offs.platform }
        # filters: {
        #   field: ga_dim_date.date__month
        #   value: "2020-05"
        # }

        derived_column: row_no {
          sql: row_number() over(order by date__date  ) ;;
        }
      }
    }

  dimension: row_no {
    type: number
    primary_key: yes
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
    dimension: drop_off_causes {
      description: ""
    }
    dimension: game {
      description: ""
    }
    dimension: game_drop_offs_count {
      description: ""
      type: number


    }
    dimension: platform {
      description: ""
    }
    # dimension: concated_value {
    #   type: string
    #   sql: concat(${drop_off_causes},' ',${Drop_Offs_Count_TM}) ;;
    # }
    measure: Drop_Offs_Count_TM {
      type: sum
      sql: ${game_drop_offs_count} ;;
      #value_format: "0.00\%"
    }

  filter: month_filter {
    type: string
#suggestions: ["01-02-2020"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]

  }

  measure: Drop_Offs_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${game_drop_offs_count} end ;;
    #value_format: "0.0"
  }

  measure: Drop_Offs_Count_Last_Month{
    type: sum
    sql: CASE WHEN {% condition month_filter %} To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${game_drop_offs_count} end ;;
    value_format: "0.0%"
  }

  measure: Drop_Offs_Growth{
    type: number
    sql: ((${Drop_Offs_selected_month}-${Drop_Offs_Count_Last_Month})/nullif(${Drop_Offs_Count_Last_Month},0)) ;;
    value_format: "0.0%"
  }

  measure: Drop_Offs_FTUE_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${game_drop_offs_count} end ;;
    #value_format: "0.0"
    filters: [drop_off_causes: "FTUE"]
  }

  measure: Drop_Offs_Count_FTUE_Last_Month{
    type: sum
    sql: CASE WHEN {% condition month_filter %} To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${game_drop_offs_count} end ;;
    value_format: "0.0%"
    filters: [drop_off_causes: "FTUE"]
  }

  measure: Drop_Offs_FTUE_Growth{
    type: number
    sql: ((${Drop_Offs_FTUE_selected_month}-${Drop_Offs_Count_FTUE_Last_Month})/nullif(${Drop_Offs_Count_FTUE_Last_Month},0)) ;;
    value_format: "0.0%"

  }

  measure: Drop_Offs_Tedious_Game_Sessions_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${game_drop_offs_count} end ;;
    #value_format: "0.0"
    filters: [drop_off_causes: "Tedious Game Sessions"]
  }

  measure: Drop_Offs_Count_Tedious_Game_Sessions_Last_Month{
    type: sum
    sql: CASE WHEN {% condition month_filter %} To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${game_drop_offs_count} end ;;
    value_format: "0.0%"
    filters: [drop_off_causes: "Tedious Game Sessions"]
  }

  measure: Drop_Offs_Tedious_Game_Sessions_Growth{
    type: number
    sql: ((${Drop_Offs_Tedious_Game_Sessions_selected_month}-${Drop_Offs_Count_Tedious_Game_Sessions_Last_Month})/nullif(${Drop_Offs_Count_Tedious_Game_Sessions_Last_Month},0)) ;;
    value_format: "0.0%"

  }

  measure: Drop_Offs_Extensive_Load_Time_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${game_drop_offs_count} end ;;
    #value_format: "0.0"
    filters: [drop_off_causes: "Extensive Load Time"]
  }


  measure: Drop_Offs_Count_Extensive_Load_Time_Last_Month{
    type: sum
    sql: CASE WHEN {% condition month_filter %} To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${game_drop_offs_count} end ;;
    value_format: "0.0%"
    filters: [drop_off_causes: "Extensive Load Time"]
  }

  measure: Drop_Offs_Extensive_Load_Time_Growth{
    type: number
    sql: ((${Drop_Offs_Extensive_Load_Time_selected_month}-${Drop_Offs_Count_Extensive_Load_Time_Last_Month})/nullif(${Drop_Offs_Count_Extensive_Load_Time_Last_Month},0)) ;;
    value_format: "0.0%"

  }


  measure: Drop_Offs_Game_Play_Balance_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${game_drop_offs_count} end ;;
    #value_format: "0.0"
    filters: [drop_off_causes: "Game Play Balance"]
  }

  measure: Drop_Offs_Count_Game_Play_Balance_Last_Month{
    type: sum
    sql: CASE WHEN {% condition month_filter %} To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${game_drop_offs_count} end ;;
    value_format: "0.0%"
    filters: [drop_off_causes: "Game Play Balance"]
  }

  measure: Drop_Offs_Game_Play_Balance_Growth{
    type: number
    sql: ((${Drop_Offs_Game_Play_Balance_selected_month}-${Drop_Offs_Count_Game_Play_Balance_Last_Month})/nullif(${Drop_Offs_Count_Game_Play_Balance_Last_Month},0)) ;;
    value_format: "0.0%"

  }



  measure: Drop_Offs_Tutorial_Interpretation_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${game_drop_offs_count} end ;;
    #value_format: "0.0"
    filters: [drop_off_causes: "Tutorial Interpretation"]
  }

  measure: Drop_Offs_Count_Tutorial_Interpretation_Last_Month{
    type: sum
    sql: CASE WHEN {% condition month_filter %} To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${game_drop_offs_count} end ;;
    value_format: "0.0%"
    filters: [drop_off_causes: "Tutorial Interpretation"]
  }

  measure: Drop_Offs_Tutorial_Interpretation_Growth{
    type: number
    sql: ((${Drop_Offs_Tutorial_Interpretation_selected_month}-${Drop_Offs_Count_Tutorial_Interpretation_Last_Month})/nullif(${Drop_Offs_Count_Tutorial_Interpretation_Last_Month},0)) ;;
    value_format: "0.0%"

  }



  measure:Game_Experience_DropOffsAndCauses_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.3;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >

      <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:14px;padding-left:5px;">
      <p ><font color="#06bee1">● &ensp;</font>FTUE<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{game_experience_drop_offs_derived.Drop_Offs_FTUE_selected_month._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:14px;padding-left:15px;">
      <p ><font color="#3388ff">● &ensp;</font>Tedious&nbsp;Game&nbsp;Sessions<br style="line-height:1.5;"><b style="font-size:29.5px;">{{game_experience_drop_offs_derived.Drop_Offs_Tedious_Game_Sessions_selected_month._rendered_value}}</b>
      </p>

      </tr>

      <tr>
      <td style="text-align:LEFT; line-height:1.0;width:200px;font-size:13px;padding-left:5px;">
      <p>
      {% if game_experience_drop_offs_derived.Drop_Offs_FTUE_Growth._value >= 0 %}

      <font color="green"> ▲ {{ game_experience_drop_offs_derived.Drop_Offs_FTUE_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ game_experience_drop_offs_derived.Drop_Offs_FTUE_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>
      </td>

      <td style="text-align:LEFT; line-height:1.0;width:200px;font-size:13px;padding-left:15px;">
      <p>
      {% if game_experience_drop_offs_derived.Drop_Offs_Tedious_Game_Sessions_Growth._value >= 0 %}

      <font color="green"> ▲ {{ game_experience_drop_offs_derived.Drop_Offs_Tedious_Game_Sessions_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ game_experience_drop_offs_derived.Drop_Offs_Tedious_Game_Sessions_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>
      </td>
      </tr>
      <tr>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:14px;padding-left:5px;">
      <br>
      <p ><font color="#33a02c">● &ensp;</font>Extensive&nbsp;Load&nbsp;Time<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{game_experience_drop_offs_derived.Drop_Offs_Extensive_Load_Time_selected_month._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:LEFT;width:200px;padding-top: 15px;font-size:14px;padding-left:15px;">
      <br>
      <p ><font color="#62b6cb">● &ensp;</font>Game&nbsp;Play&nbsp;Balance<br style="line-height:1.5;"><b style="font-size:29.5px;">{{game_experience_drop_offs_derived.Drop_Offs_Game_Play_Balance_selected_month._rendered_value}}</b>
      </p>
      </td>
      <tr>
      <td style="text-align:LEFT; line-height:1.0;width:200px;font-size:13px;padding-left:5px;">
      <p>
      {% if game_experience_drop_offs_derived.Drop_Offs_Extensive_Load_Time_Growth._value >= 0 %}

      <font color="green"> ▲ {{ game_experience_drop_offs_derived.Drop_Offs_Extensive_Load_Time_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ game_experience_drop_offs_derived.Drop_Offs_Extensive_Load_Time_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>
      </td>

      <td style="text-align:LEFT; line-height:1.0;width:200px;font-size:13px;padding-left:20px;">
      <p>
      {% if game_experience_drop_offs_derived.Drop_Offs_Game_Play_Balance_Growth._value >= 0 %}

      <font color="green"> ▲ {{ game_experience_drop_offs_derived.Drop_Offs_Game_Play_Balance_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ game_experience_drop_offs_derived.Drop_Offs_Game_Play_Balance_Growth._rendered_value }}</font>&nbsp; LM

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
