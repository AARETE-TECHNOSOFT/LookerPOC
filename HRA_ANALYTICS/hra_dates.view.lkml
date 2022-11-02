# The name of this view in Looker is "Hra Dates"
view: hra_dates {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".HRA_DATES
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: datevalue {
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
    sql: ${TABLE}.DATEVALUE ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Dayvalue" in Explore.

  dimension: dayvalue {
    type: number
    sql: ${TABLE}.DAYVALUE ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_dayvalue {
    type: sum
    sql: ${dayvalue} ;;
  }

  measure: average_dayvalue {
    type: average
    sql: ${dayvalue} ;;
  }

  dimension: mon {
    type: string
    sql: ${TABLE}.MON ;;
  }

  dimension: monthvalue {
    type: number
    sql: ${TABLE}.MONTHVALUE ;;
  }

  dimension: monthvaluename {
    type: string
    sql: ${TABLE}.MONTHVALUENAME ;;
  }

  dimension: weekdayvalue {
    type: number
    sql: ${TABLE}.WEEKDAYVALUE ;;
  }

  dimension: weekdayvaluename {
    type: string
    sql: ${TABLE}.WEEKDAYVALUENAME ;;
  }

  dimension: yearvalue {
    type: number
    sql: ${TABLE}.YEARVALUE ;;
    value_format: "0"
  }

  measure: count {
    type: count
    drill_fields: [weekdayvaluename, monthvaluename]
  }


  dimension: Overview_header_GenderBreakDown{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Gender Breakdown &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Overview_header_EmployeeCountByType{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Employee By Employment Type &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Overview_header_EmployeeByDepartment{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Employee By Department &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Overview_header_Employees{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Employees &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Department_header_EmployeeType{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Employee Type &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Department_header_Gender{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Gender &nbsp;
      </h1>
      </html>
      ;;
  }
  dimension: Overview_header_NewEmployees{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">New Employees &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Department_header_TurnoverRate{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Turnover Rate &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Department_header_LeaversEmp{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Leavers Employee &nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Department_header_EmployeeBySubDepartment{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Employee By SubDepartment&nbsp;
      </h1>
      </html>
      ;;
  }
  dimension: Overview_header_OccupancyRate{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Occupancy Rate &nbsp;
      </h1>
      </html>
      ;;
  }


  dimension: MonthlyAnalysis_header_FutureHiringPlans{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Future Hiring Plans&nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: MonthlyAnalysis_header_EmployeeInOut{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Employee In & Out&nbsp;
      </h1>
      </html>
      ;;
  }


  dimension: MonthlyAnalysis_header_OpenPositions{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Open Positions&nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Historical_header_EMPCountByYearGender{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Employees by Year & Gender&nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Historical_header_TurnOver{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Turnover&nbsp;
      </h1>
      </html>
      ;;
  }

  dimension: Historical_header_Leavers{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Leavers&nbsp;
      </h1>
      </html>
      ;;
  }

  dimension:Training_header_ActualNoofParticipantTrainingName{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Actual No. of Participant - Training Name&nbsp;
      </h1>
      </html>
      ;;
  }

  dimension:Training_header_ActualParticipantsTrainingType{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Actual No. of Participant - Training Type&nbsp;
      </h1>
      </html>
      ;;
  }

  dimension:Training_header_TrainingManHours{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Training Man Hours - Month Name&nbsp;
      </h1>
      </html>
      ;;
  }

  dimension:Training_header_OccupancyRate{
    sql: 1 ;;
    html:
      <html>
      <h1 style="color:black;background-color:#ffffff;font-size: 13pt; margin:10px auto;text-align:left;border-radius: 10px;">Occupancy Rate&nbsp;
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
                                       <p ><a style="color:#4A6DE5;cursor: pointer;"class="current" target="_blank" style="font-weight: bold;">
                                      <img src="https://www.linkpicture.com/q/eye-4.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;"/>&ensp;Overview</a>
                                       </p>
                                 </td>
                                  <td style="text-align:center;width:200px;padding-top:10px;">
                                      <p><a href="https://thirdi.looker.com/dashboards/160?Year={{ _filters['hra_dates.yearvalue'] | url_encode }} " target="_blank" style="color:black;">
                                     <img src="https://www.linkpicture.com/q/hierarchical-structure.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Departments</a>
                                      </p>
                                  </td>
                                 <td  style="text-align:center;width:200px;padding-top:10px;">
                                      <p><a href="https://thirdi.looker.com/dashboards/161?" target="_blank" style="color:black">
                                      <img src="https://www.linkpicture.com/q/replay.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Historical</a>
                                      </p>
                                  </td>

      <td  style="text-align:center;width:200px;padding-top:10px;">
      <p><a href="https://thirdi.looker.com/dashboards/162?Year={{ _filters['hra_dates.yearvalue'] | url_encode }}&Month={{ _filters['hra_dates.mon'] | url_encode }}" target="_blank" style="color:black">
      <img src="https://www.linkpicture.com/q/growth-graph.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Monthly Analysis</a>
      </p>
      </td>

      <td  style="text-align:center;width:200px;padding-top:10px;">
      <p><a href="https://thirdi.looker.com/dashboards/163?Quarter=&Year={{ _filters['hra_dates.yearvalue'] | url_encode }}"target="_blank" style="color:black">
      <img src="https://www.linkpicture.com/q/group_6.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Training</a>
      </p>
      </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }




  measure:Department1{

    sql: 1 ;;
    html:
    <html>

                        <body>
                           <table style="width:100%;height:50%;align:center;font-size:20px;padding-top: 40px;padding-bottom: 20px;" >
                             <tr>

                                  <td style="text-align:center;width:200px;padding-top:10px;">
                                      <p><a href="https://thirdi.looker.com/dashboards/159?Year={{ _filters['hra_dates.yearvalue'] | url_encode }}" target="_blank" style="color:black;">
                                     <img src="https://www.linkpicture.com/q/eye-3.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Overview</a>
                                      </p>
                                  </td>

                  <td style="text-align:center;width:200px;padding-top:10px;">
                                       <p ><a style="color:#4A6DE5;cursor: pointer;"class="current" target="_blank" style="font-weight: bold;">
                                      <img src="https://www.linkpicture.com/q/hierarchical-structure-1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;"/>&ensp;Departments</a>
                                       </p>
                                 </td>

                                 <td  style="text-align:center;width:200px;padding-top:10px;">
                                      <p><a href="https://thirdi.looker.com/dashboards/161?" target="_blank" style="color:black">
                                      <img src="https://www.linkpicture.com/q/replay.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Historical</a>
                                      </p>
                                  </td>

      <td  style="text-align:center;width:200px;padding-top:10px;">
      <p><a href="https://thirdi.looker.com/dashboards/162?Year={{ _filters['hra_dates.yearvalue'] | url_encode }}&Department+={{ _filters['hra_sub_department.department_name'] | url_encode }}&Month={{ _filters['hra_dates.mon'] | url_encode }}" target="_blank" style="color:black">
      <img src="https://www.linkpicture.com/q/growth-graph.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Monthly Analysis</a>
      </p>
      </td>

      <td  style="text-align:center;width:200px;padding-top:10px;">
      <p><a href="https://thirdi.looker.com/dashboards/163?Quarter=&Year={{ _filters['hra_dates.yearvalue'] | url_encode }}"target="_blank" style="color:black">
      <img src="https://www.linkpicture.com/q/group_6.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Training</a>
      </p>
      </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }

  measure:Historical1{

    sql: 1 ;;
    html:
    <html>

                        <body>
                           <table style="width:100%;height:50%;align:center;font-size:20px;padding-top: 40px;padding-bottom: 20px;" >
                             <tr>
                                  <td style="text-align:center;width:200px;padding-top:10px;">
                                       <p ><a href="https://thirdi.looker.com/dashboards/159?Year={{ _filters['hra_dates.yearvalue'] | url_encode }}" target="_blank" style="color:black">
                                      <img src="https://www.linkpicture.com/q/eye-3.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;"/>&ensp;Overview</a>
                                       </p>
                                 </td>
                                  <td style="text-align:center;width:200px;padding-top:10px;">
                                      <p><a href="https://thirdi.looker.com/dashboards/160?Year={{ _filters['hra_dates.yearvalue'] | url_encode }}" target="_blank" style="color:black;">
                                     <img src="https://www.linkpicture.com/q/hierarchical-structure.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Departments</a>
                                      </p>
                                  </td>
                                 <td  style="text-align:center;width:200px;padding-top:10px;">
                                      <p><a style="color:#4A6DE5;cursor: pointer;"class="current" target="_blank" style="font-weight: bold;">
                 <img src="https://www.linkpicture.com/q/replay-1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Historical</a>
                                      </p>
                                  </td>

                  <td  style="text-align:center;width:200px;padding-top:10px;">
                  <p><a href="https://thirdi.looker.com/dashboards/162?" target="_blank" style="color:black">
                  <img src="https://www.linkpicture.com/q/growth-graph.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Monthly Analysis</a>
                  </p>
                  </td>

                  <td  style="text-align:center;width:200px;padding-top:10px;">
                  <p><a href="https://thirdi.looker.com/dashboards/163?"target="_blank" style="color:black">
                  <img src="https://www.linkpicture.com/q/group_6.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Training</a>
                  </p>
                  </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
  }

 measure:MonthlyAnalysis1
{
sql: 1 ;;
  html:
    <html>

                        <body>
                           <table style="width:100%;height:50%;align:center;font-size:20px;padding-top: 40px;padding-bottom: 20px;" >
                             <tr>
                                  <td style="text-align:center;width:200px;padding-top:10px;">
                                       <p ><a href="https://thirdi.looker.com/dashboards/159?Year={{ _filters['hra_dates.yearvalue'] | url_encode }}" target="_blank" style="color:black">
                                      <img src="https://www.linkpicture.com/q/eye-3.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;"/>&ensp;Overview</a>
                                       </p>
                                 </td>
                                  <td style="text-align:center;width:200px;padding-top:10px;">
                                      <p><a href="https://thirdi.looker.com/dashboards/160?Year={{ _filters['hra_dates.yearvalue'] | url_encode }}&Department={{ _filters['hra_sub_department.department_name'] | url_encode }} " target="_blank" style="color:black;">
                                     <img src="https://www.linkpicture.com/q/hierarchical-structure.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Departments</a>
                                      </p>
                                  </td>
                                 <td  style="text-align:center;width:200px;padding-top:10px;">
                                      <p><a href="https://thirdi.looker.com/dashboards/161?" target="_blank" style="color:black">
                                      <img src="https://www.linkpicture.com/q/replay.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Historical</a>
                                      </p>
                                  </td>

                                <td style="text-align:center;width:200px;padding-top:10px;">
                                       <p ><a style="color:#4A6DE5;cursor: pointer;"class="current" target="_blank" style="font-weight: bold;">
                                      <img src="https://www.linkpicture.com/q/growth-graph-1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;"/>&ensp;Monthly Analysis</a>
                                       </p>
                                 </td>

                  <td  style="text-align:center;width:200px;padding-top:10px;">
                  <p><a href="https://thirdi.looker.com/dashboards/163?Quarter=&Year={{ _filters['hra_dates.yearvalue'] | url_encode }}"target="_blank" style="color:black">
                  <img src="https://www.linkpicture.com/q/group_6.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Training</a>
                  </p>
                  </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
}

measure:Training1{

  sql: 1 ;;
  html:
    <html>

                        <body>
                           <table style="width:100%;height:50%;align:center;font-size:20px;padding-top: 40px;padding-bottom: 20px;" >
                             <tr>

                   <td style="text-align:center;width:200px;padding-top:10px;">
                                      <p><a href="https://thirdi.looker.com/dashboards/159?Year={{ _filters['hra_dates.yearvalue'] | url_encode }} " target="_blank" style="color:black;">
                                     <img src="https://www.linkpicture.com/q/eye-3.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Overview</a>
                                      </p>
                                  </td>

                                  <td style="text-align:center;width:200px;padding-top:10px;">
                                      <p><a href="https://thirdi.looker.com/dashboards/160?Year={{ _filters['hra_dates.yearvalue'] | url_encode }}" target="_blank" style="color:black;">
                                     <img src="https://www.linkpicture.com/q/hierarchical-structure.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Departments</a>
                                      </p>
                                  </td>
                                 <td  style="text-align:center;width:200px;padding-top:10px;">
                                      <p><a href="https://thirdi.looker.com/dashboards/161?" target="_blank" style="color:black">
                                      <img src="https://www.linkpicture.com/q/replay.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Historical</a>
                                      </p>
                                  </td>

                  <td  style="text-align:center;width:200px;padding-top:10px;">
                  <p><a href="https://thirdi.looker.com/dashboards/162?Year={{ _filters['hra_dates.yearvalue'] | url_encode }}&Month={{ _filters['hra_dates.mon'] | url_encode }}" target="_blank" style="color:black">
                  <img src="https://www.linkpicture.com/q/growth-graph.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;" />&ensp;Monthly Analysis</a>
                  </p>
                  </td>


                  <td style="text-align:center;width:200px;padding-top:10px;">
                                       <p ><a style="color:#4A6DE5;cursor: pointer;"class="current" target="_blank" style="font-weight: bold;">
                                      <img src="https://www.linkpicture.com/q/group-1.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;"/>&ensp;Training</a>
                                       </p>
                                 </td>
      </tr>
      </table>

      </body>
      </html>
      ;;
}
}
