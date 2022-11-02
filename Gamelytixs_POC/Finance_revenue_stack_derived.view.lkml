view: finance_revenue_stack_derived {

    derived_table: {
      explore_source: ga_dim_date {
        column: country { field: ga_finance_revenue_stack.country }
        column: date__date { field: ga_finance_revenue_stack.date__date }
        column: date__month { field: ga_finance_revenue_stack.date__month }
        column: date__quarter { field: ga_finance_revenue_stack.date__quarter }
        column: date__week { field: ga_finance_revenue_stack.date__week }
        column: date__year { field: ga_finance_revenue_stack.date__year }
        column: game { field: ga_finance_revenue_stack.game }
        column: platform { field: ga_finance_revenue_stack.platform }
        column: revenue { field: ga_finance_revenue_stack.revenue }
        column: revenue_actual { field: ga_finance_revenue_stack.revenue_actual }
        column: revenue_stack { field: ga_finance_revenue_stack.revenue_stack }
        derived_column: row_no {
          sql: row_number() over(order by date__date desc ) ;;
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
    dimension: Previous_month {
      type: date
      sql: add_months(to_date(${ga_dim_date.date__date},'rr-mm-dd'),-1);;

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
    dimension: game {
      description: ""
    }
    dimension: platform {
      description: ""
    }
    dimension: revenue {
      description: ""
      type: number
    }
    dimension: revenue_actual {
      description: ""
      type: number
    }
    dimension: revenue_stack {
      description: ""
    }
    measure: Revenue_TM {
      type: sum
      sql: ${revenue_actual} ;;
      value_format: "$0.0,,\" M\""
      html:
      <p style="font-size:25px;">{{rendered_value}}</p>;;
    }

  measure: Revenue1 {
    type: sum
    sql: ${revenue_actual} ;;
    value_format: "$0"
    }

    measure: Target {
      type: number
      sql: 120000000;;
      value_format: "$0"
    }
  dimension: Start_Date {
    type: string
    sql: '2020-01-01' ;;

  }

  dimension: End_Date {
    type: string
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${date__date} end ;;

  }

  filter: month_filter1 {
    type: date
    #suggestions: ["01-02-2020"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]

  }

  measure: Last12month {
    type: average
    sql:case when ${date__date}>= ${Start_Date} and to_date(${date__date},'yyyy-mm-dd')< {% date_end month_filter1 %} then 1 else 0 end  ;;
  }

  measure: revenue_Last12months {
    type: number
    sql:case when ${Last12month}=1 then
      sum(${revenue_actual}) else null end;;
    value_format: "$0"
  }


    measure: Revenue_This_Month {
      type: sum
      sql: ${revenue_actual} ;;
      # value_format: "0.0,,\" M\""
    }

  measure: Revenue_Target {
    type: number
    sql: 250000000;;
    value_format: "0,,\" M\""
  }

  filter: month_filter {
    type: string
    #suggestions: ["01-02-2020"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]

  }

  measure: Revenue_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${ga_dim_date.date__month} {% endcondition %} then ${revenue_actual} end ;;
    value_format: "$0.0,,\" M\""
  }

  measure: Revenue_LM_pr{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${ga_dim_date.date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${revenue_actual} end ;;
    value_format: "$0.0,,\" M\""
  }

  measure: Revenue_Growth{
    type: number
    sql: ((${Revenue_selected_month}-${Revenue_LM_pr})/nullif(${Revenue_selected_month},0)) ;;
    value_format: "0.0%"
    # html:
    # <html>
    # {% if finance_revenue_stack_derived.Revenue_Growth._value > 0 %}
    #       <p style="color: #009900">▲  {{ finance_revenue_stack_derived.Revenue_Growth._value | url_encode }}</p>
    #       {% else %}
    #       <p style="color: #990000">▼ {{ finance_revenue_stack_derived.Revenue_Growth._value | url_encode }}</p>

    #       {% endif %}
    # </html>
    # ;;
  }

  measure: Revenue_selected_month_Advertisement {
    type: sum
    sql: case when {% condition month_filter %} ${ga_dim_date.date__month} {% endcondition %} then ${revenue_actual} end ;;
    value_format: "$0.0,,\" M\""
    filters: [revenue_stack: "In-App Advertisements"]
  }

  measure: Revenue_LM_Advertisement{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${ga_dim_date.date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${revenue_actual} end ;;
    value_format: "$0.0,,\" M\""
    filters: [revenue_stack: "In-App Advertisements"]
  }

  measure: Revenue_Growth_Advertisement{
    type: number
    sql: ((${Revenue_selected_month_Advertisement}-${Revenue_LM_Advertisement})/nullif(${Revenue_selected_month_Advertisement},0)) ;;
    value_format: "0.0%"
  }

  measure: Revenue_selected_month_Purchases {
    type: sum
    sql: case when {% condition month_filter %} ${ga_dim_date.date__month} {% endcondition %} then ${revenue_actual} end ;;
    value_format: "$0.0,,\" M\""
    filters: [revenue_stack: "In-App Purchases"]
    }

  measure: Revenue_LM_Purchases{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${ga_dim_date.date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${revenue_actual} end ;;
    value_format: "$0.0,,\" M\""
    filters: [revenue_stack: "In-App Purchases"]
  }

  measure: Revenue_Growth_Purchases{
    type: number
    sql: ((${Revenue_selected_month_Purchases}-${Revenue_LM_Purchases})/nullif(${Revenue_selected_month_Purchases},0)) ;;
    value_format: "0.0%"
  }

  measure: Revenue_selected_month_PaidApps {
    type: sum
    sql: case when {% condition month_filter %} ${ga_dim_date.date__month} {% endcondition %} then ${revenue_actual} end ;;
    value_format: "$0.0,,\" M\""
    filters: [revenue_stack: "Premium Paid Apps"]
    }

  measure: Revenue_LM_PaidApps{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${ga_dim_date.date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${revenue_actual} end ;;
    value_format: "$0.0,,\" M\""
    filters: [revenue_stack: "Premium Paid Apps"]
  }

  measure: Revenue_Growth_PaidApps{
    type: number
    sql: ((${Revenue_selected_month_PaidApps}-${Revenue_LM_PaidApps})/nullif(${Revenue_selected_month_PaidApps},0)) ;;
    value_format: "0.0%"
  }


  measure: Revenue_selected_month_CharUpgrade {
    type: sum
    sql: case when {% condition month_filter %} ${ga_dim_date.date__month} {% endcondition %} then ${revenue_actual} end ;;
    value_format: "$0.0,,\" M\""
    filters: [revenue_stack: "Character Upgrades"]
  }

  measure: Revenue_LM_CharUpgrade{
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${ga_dim_date.date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${revenue_actual} end ;;
    value_format: "$0.0,,\" M\""
    filters: [revenue_stack: "Character Upgrades"]
  }

  measure: Revenue_Growth_CharUpgrade{
    type: number
    sql: ((${Revenue_selected_month_CharUpgrade}-${Revenue_LM_CharUpgrade})/nullif(${Revenue_selected_month_CharUpgrade},0)) ;;
    value_format: "0.0%"
  }


  measure:Finance_Revenue_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:15px;padding-left: 30px;padding-top: 30px;padding-bottom: 30px;padding-right:30px;background-color: #ffffff;border-radius: 5px; " >
       <tr>
      <td style="text-align:left;width:200px;padding-top: 15px;font-size:13px;padding-left:10px;">
      REVENUE<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{finance_revenue_stack_derived.Revenue_selected_month._rendered_value}}</b>

      </td>
      <td style="text-align:center;width:200px;padding-top: 35px;font-size:14px;padding-left:55px;">
      Target<br><b style="font-size:15px;">
       {{ finance_revenue_stack_derived.Revenue_Target._rendered_value }}
      </b>
      </td>
     </tr>

      <tr>
      <td style="text-align:left; line-height:1.5;width:200px;font-size:13px;Padding-left:15px;">
      <p>
      {% if finance_revenue_stack_derived.Revenue_Growth._value >= 0 %}

      <font color="green"> ▲ {{ finance_revenue_stack_derived.Revenue_Growth._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ finance_revenue_stack_derived.Revenue_Growth._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </p>
      </td>

      </tr>
      </table>

      </body>
      </html>
      ;;
  }



  measure:Finance_Revenue_Stack_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height: 1.5;align:center;font-size:14px;padding-left:5px;padding-top: 15px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >

      <tr>
      <td style="text-align:left;width:200px;Padding-left:3%">
      <font color="#33a02c">● &ensp;</font>In-App&nbsp;Advertisements<br style="line-height:1.5;"><b style="font-size:29.5px; ">{{finance_revenue_stack_derived.Revenue_selected_month_Advertisement._rendered_value}}</b>

      </td>

      <td style="text-align:left;align:right;width:150px;Padding-right:3%">
      <font color="#F5A50A">● &ensp;</font>In-App&nbsp;Purchases<br style="line-height:1.5;"><b style="font-size:29.5px;">{{finance_revenue_stack_derived.Revenue_selected_month_Purchases._rendered_value}}</b>

      </td>
      </tr>

      <tr>
      <td style="text-align:left; line-height:1.5;width:200px;font-size:13px;Padding-left:3%">

      {% if finance_revenue_stack_derived.Revenue_Growth_Advertisement._value >= 0 %}

      <font color="green"> ▲ {{ finance_revenue_stack_derived.Revenue_Growth_Advertisement._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ finance_revenue_stack_derived.Revenue_Growth_Advertisement._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>

      <td style="text-align:left; align:right;line-height:1.5;width:150px;font-size:13px;Padding-right:3%">

      {% if finance_revenue_stack_derived.Revenue_Growth_Purchases._value >= 0 %}

      <font color="green"> ▲ {{ finance_revenue_stack_derived.Revenue_Growth_Purchases._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ finance_revenue_stack_derived.Revenue_Growth_Purchases._rendered_value }}</font>&nbsp; LM

      {% endif %}

      </td>
      </tr>
      <tr>
      <td style="text-align:left;width:200px;Padding-top:15px;Padding-left:3%">

     <br>
      <font color="#3388ff ">● &ensp;</font>Premium&nbsp;Paid&nbsp;Apps<br style="line-height:1.3;"><b style="font-size:29.5px; ">{{finance_revenue_stack_derived.Revenue_selected_month_PaidApps._rendered_value}}</b>
      </td>

      <td style="text-align:left;align:right;width:150px;Padding-top:15px;Padding-right:3%">

      <br>
      <font color="#ed6168">● &ensp;</font>Character&nbsp;Upgrades<br style="line-height:1.3;"><b style="font-size:29.5px;">{{finance_revenue_stack_derived.Revenue_selected_month_CharUpgrade._rendered_value}}</b>

      </td>

       <tr>
      <td style="text-align:left; line-height:1.5;width:200px;font-size:13px;Padding-left:3%;">

      {% if finance_revenue_stack_derived.Revenue_Growth_PaidApps._value >= 0 %}

      <font color="green"> ▲ {{ finance_revenue_stack_derived.Revenue_Growth_PaidApps._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ finance_revenue_stack_derived.Revenue_Growth_PaidApps._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>

      <td style="text-align:left;align:right;line-height:1.5;width:150px;font-size:13px;Padding-right:3%">

      {% if finance_revenue_stack_derived.Revenue_Growth_CharUpgrade._value >= 0 %}

      <font color="green"> ▲ {{ finance_revenue_stack_derived.Revenue_Growth_CharUpgrade._rendered_value }}</font>&nbsp; LM

      {% else %}

      <font color="red"> ▼  {{ finance_revenue_stack_derived.Revenue_Growth_CharUpgrade._rendered_value }}</font>&nbsp; LM

      {% endif %}


      </td>
      </tr>


      </table>



      </body>
      </html>
      ;;
  }









  }
