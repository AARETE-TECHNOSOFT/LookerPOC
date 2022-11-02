# The name of this view in Looker is "Ga Predictions"
view: ga_predictions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".GA_PREDICTIONS
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cagr" in Explore.

  dimension: cagr {
    type: number
    sql: ${TABLE}.CAGR ;;
  }

  dimension: churn_rate {
    type: number
    sql: ${TABLE}.CHURN_RATE ;;
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}.NEW_USERS ;;
  }

  dimension: profit {
    type: number
    sql: ${TABLE}.PROFIT ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: Sum_profit {
    type: sum
    sql: ${profit} ;;
    value_format: "$0.0,,\" M\""
    html:
    <p style="font-size:25px;display: inline-block;">
    <img src="https://img.icons8.com/ultraviolet/40/000000/refresh--v1.png" width="30" height="35" style="padding-bottom:5px;" style="padding-bottom:8px;"/>&nbsp;{{rendered_value}}</p>
    ;;
  }

  measure: average_profit {
    type: average
    sql: ${profit} ;;
  }

  dimension: quarter {
    primary_key: yes
    type: string
    sql: ${TABLE}.QUARTER ;;

  }

  dimension: retention_rate {
    type: number
    sql: ${TABLE}.RETENTION_RATE ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.REVENUE ;;
  }
  measure: AVG_Rentenion_Rate {
    type: average
    sql: ${TABLE}.RETENTION_RATE ;;
    value_format: "0.0\%"
    html:
    <p style="font-size:25px;display: inline-block;">
    <img src="https://img.icons8.com/ultraviolet/40/000000/add-user-male.png" width="30" height="35" style="padding-bottom:8px;"/>&nbsp;{{rendered_value}}</p>
    ;;
  }

  measure: Sum_Revenue {
    type: sum
    sql: ${TABLE}.REVENUE ;;
    value_format: "$0.0,,\" M\""
    html: <p style="font-size:25px;display: inline-block;">
   <img src="https://img.icons8.com/ultraviolet/40/000000/database-restore.png" width="30" height="35" margin-bottom="40" style="padding-bottom:8px;" />&nbsp;{{rendered_value}}</p>
    ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: CAGR_AVG {
    type: average
    sql: ${TABLE}.CAGR  ;;
    value_format: "0.0\%"
  }
  measure: Sum_newusers {
    type: sum
    sql:  ${TABLE}.NEW_USERS ;;
    value_format: "0.0,\" K\""
    html: <p style="font-size:25px;display: inline-block;">
    <img src="https://img.icons8.com/ultraviolet/40/000000/conference.png" width="30" height="35" margin-bottom="40" style="padding-bottom:8px;"/>&nbsp;{{rendered_value}}</p>
    ;;
  }
  measure: AVG_Churn_Rate {
    type: average
    sql: ${TABLE}.CHURN_RATE  ;;
    value_format: "0.0%"
    html: <p style="font-size:25px;display: inline-block;">
    <img src="https://img.icons8.com/ultraviolet/40/000000/combo-chart.png" width="30" height="35" margin-bottom="40" style="padding-bottom:8px;" />&nbsp;{{rendered_value}}</p>
    ;;
  }

  measure:Overview_PredictionMetrics_tab{
    sql: 1 ;;
    html:
    <html>
    <body>

        <h1 style="color:black;line-height:0.5;font-size: 14pt; margin:20px auto;text-align:left; padding-left: 20px;border-radius: 10px;padding-top: 10px;padding-bottom:10px;"><b style="font-size:36px; ">{{ga_dim_date.date__quarter._rendered_value}} &nbsp;</b></h1>

        <hr>
      <table style="width:100%;height:50%;line-height: 1.0;align:left;font-size:13px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >


      <tr style="line-height: 1.0;font-size: 12pt;border-radius: 10px;background-color:#ffffff;">
      <td style="text-align:center;width:200px;">

      <img src="https://www.linkpicture.com/q/arrow-growth.svg" width="30" height="35" margin-bottom="40" style="padding-bottom:8px;align:left"/>&nbsp;CAGR<br style="line-height:1.0;font-size: 8pt;text-align:left;"><b style="font-size:29.5px; ">{{ga_predictions.CAGR_AVG._rendered_value}}</b>

      </td>
      <td style="text-align:center;width:200px;">
      <p ><img src="https://www.linkpicture.com/q/user.svg" width="30" height="30" margin-bottom="40" style="padding-bottom:8px;"/>&nbsp;New Users<br style="line-height:1.0;font-size:8pt;"><b style="font-size:29.5px; ">{{ga_predictions.Sum_newusers._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:center;width:200px;">
      <p ><img src="https://www.linkpicture.com/q/coins.svg" width="30" height="30" margin-bottom="40" style="padding-bottom:8px;" />&nbsp;Revenue<br style="line-height:1.0;font-size:8pt;"><b style="font-size:29.5px; ">{{ga_predictions.Sum_Revenue._rendered_value}}</b>
      </p>
      </td>


      <tr style="line-height: 1.0;font-size: 12pt;border-radius: 10px;background-color:#ffffff;">
      <td style="text-align:center;width:200px;">
      <br>

      <p > <img src="https://www.linkpicture.com/q/user-plus.svg" width="30" height="30" margin-bottom="40" style="padding-bottom:8px;"/>&nbsp;Retention Rate<br style="line-height:1.0;font-size:8pt;"><b style="font-size:29.5px; ">{{ga_predictions.AVG_Rentenion_Rate._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:center;width:200px;">
      <br>

      <p ><img src="https://www.linkpicture.com/q/chart-line.svg" width="30" height="30" margin-bottom="40" style="padding-bottom:8px;" />&nbsp;Churn Rate<br style="line-height:1.0;font-size: 8pt;"><b style="font-size:29.5px; ">{{ga_predictions.AVG_Churn_Rate._rendered_value}}</b>
      </p>
      </td>
      <td style="text-align:center;width:200px;">
      <br>

      <p ><img src="https://www.linkpicture.com/q/process.svg" width="30" height="30" margin-bottom="40" style="padding-bottom:8px;"/>&nbsp;Profit<br style="line-height:1.0;font-size: 13pt;"><b style="font-size:29.5px; ">{{ga_predictions.Sum_profit._rendered_value}}</b>
      </p>
      </td>
      </tr>


      </table>



      </body>
      </html>
      ;;
  }




}
