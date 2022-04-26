# The name of this view in Looker is "Hr Subdepartment"

view: hr_subdepartment {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".HR_SUBDEPARTMENT
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Department Name" in Explore.

  dimension: department_name {
    type: string
    sql: ${TABLE}.DEPARTMENT_NAME ;;
    html:
    <a href="https://thirdi.looker.com/dashboards/110?Department={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year+=2016" target="_blank">{{ value }}</a>

      ;;


    #   link: {
    #     label: "subdepartment Name"
    #     #url: "https://thirdi.looker.com/dashboards/110?&Department={{ _filters[‘hr_subdepartment.department_name’] | url_encode }}&Date={{ _filters['orders.date'] | url_encode }}&Year+=2016"
    #     url: "https://thirdi.looker.com/dashboards/110?Department={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year+=2016"

    # }
  }
  dimension: dept {
    type: string
    sql: ${TABLE}.DEPARTMENT_NAME ;;
    html:
      <a href="https://thirdi.looker.com/dashboards/112?Department+={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year={{ _filters['hr_dates.yearvalue'] | url_encode }}&Month=Dec" target="_blank">{{ value }}</a>
      ;;
  }

  dimension: deptid {
    type: number
    value_format_name: id
    sql: ${TABLE}.DEPTID ;;
  }

  dimension: subdepartment {
    type: number
    sql: ${TABLE}.SUBDEPARTMENT ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_subdepartment {
    type: sum
    sql: ${subdepartment} ;;
  }

  measure: average_subdepartment {
    type: average
    sql: ${subdepartment} ;;
  }

  dimension: subdepartment_name {
    type: string
    sql: ${TABLE}.SUBDEPARTMENT_NAME ;;

  }

  measure: count {
    type: count
    drill_fields: [department_name, subdepartment_name]
  }

  dimension: htmlcode {
    sql: 1 ;;
    html:
    <html>
    <body>
    <P style="color:White;background-color:#3D99AD  ;font-size: 15pt; margin:5px auto;text-align:left;padding-left: 30px;margin:0;">
      Departments</p>
      <P style="color:black;background-color:#C4CCCE ;font-size: 15pt; margin:5px auto;text-align:left;padding-left: 30px;margin : 0">

      <a href="https://thirdi.looker.com/dashboards/102?Year={{ _filters['hr_dates.yearvalue'] | url_encode }}" target="_blank" style="color:White">Overview   🢂</a>&emsp;&emsp;

      <a href=" https://thirdi.looker.com/dashboards/107" target="_blank" style="color:White">Historical   🢂</a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/112?Department+={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year={{ _filters['hr_dates.yearvalue'] | url_encode }}&Month=Dec" target="_blank" style="color:White">Monthly Analysis   🢂</a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/103?Quarter=&Year={{ _filters['hr_dates.yearvalue'] | url_encode }}" target="_blank" style="color:White">Training   🢂</a>

      </p>
      </body>
      </html>
      ;;
  }

  dimension: htmlcode1 {
    sql: 1 ;;
    html:
    <html>
    <body>
    <P style="color:White;background-color:#3D99AD  ;font-size: 15pt; margin:5px auto;text-align:left;padding-left: 30px;margin:0;">
    Overview</p>
    <P style="color:black;background-color:#C4CCCE ;font-size: 15pt; margin:5px auto;text-align:left;padding-left: 30px;margin : 0">

      <a href=" https://thirdi.looker.com/dashboards/110?Department={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year+={{ _filters['hr_dates.yearvalue'] | url_encode }}" target="_blank"style="color:White">Department   🢂</a>&emsp;&emsp;

      <a href=" https://thirdi.looker.com/dashboards/107" target="_blank" style="color:White">Historical   🢂</a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/112?Department+={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year={{ _filters['hr_dates.yearvalue'] | url_encode }}&Month=Dec" target="_blank" style="color:White">Monthly Analysis   🢂</a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/103?Quarter=&Year={{ _filters['hr_dates.yearvalue'] | url_encode }}" target="_blank" style="color:White">Training   🢂</a>

      </p>
      </body>
      </html>;;
  }

  dimension: htmlcode2 {
    sql: 1 ;;
    html:
    <html>
    <body>
    <P style="color:White;background-color:#3D99AD  ;font-size: 15pt; margin:5px auto;text-align:left;padding-left: 30px;margin:0;">
    Historical</p>
    <P style="color:black;background-color:#C4CCCE ;font-size: 15pt; margin:5px auto;text-align:left;padding-left: 30px;margin : 0">

      <a href="https://thirdi.looker.com/dashboards/102?Year={{ _filters['hr_dates.yearvalue'] | url_encode }}" target="_blank" style="color:White">Overview   🢂</a>&emsp;&emsp;

      <a href=" https://thirdi.looker.com/dashboards/110?Department={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year+={{ _filters['hr_dates.yearvalue'] | url_encode }}" target="_blank"style="color:White">Departments   🢂</a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/112?Department+={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year={{ _filters['hr_dates.yearvalue'] | url_encode }}&Month=Dec" target="_blank" style="color:White">Monthly Analysis   🢂</a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/103?Quarter=&Year={{ _filters['hr_dates.yearvalue'] | url_encode }}" target="_blank" style="color:White">Training   🢂</a>

      </p>
      </body>
      </html>;;
  }
  dimension: htmlcode3 {
    sql: 1 ;;
    html:
    <html>
    <body>
    <P style="color:White;background-color:#3D99AD  ;font-size: 15pt; margin:5px auto;text-align:left;padding-left: 30px;margin:0;">
    Monthly analysis</p>
    <P style="color:black;background-color:#C4CCCE ;font-size: 15pt; margin:5px auto;text-align:left;padding-left: 30px;margin : 0">

      <a href="https://thirdi.looker.com/dashboards/102?Year={{ _filters['hr_dates.yearvalue'] | url_encode }}" target="_blank" style="color:White">Overview   🢂</a>&emsp;&emsp;

      <a href=" https://thirdi.looker.com/dashboards/110?Department={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year+={{ _filters['hr_dates.yearvalue'] | url_encode }}" target="_blank"style="color:White">Departments   🢂</a>&emsp;&emsp;

      <a href=" https://thirdi.looker.com/dashboards/107" target="_blank" style="color:White">Historical   🢂</a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/103?Quarter=&Year={{ _filters['hr_dates.yearvalue'] | url_encode }}" target="_blank" style="color:White">Training   🢂</a>

      </p>
      </body>
      </html>;;
  }
  dimension: htmlcode4 {
    sql: 1 ;;
    html:
    <html>
    <body>
    <P style="color:White;background-color:#3D99AD  ;font-size: 15pt; margin:5px auto;text-align:left;padding-left: 30px;margin:0;">
    <big>Training<big></p>
    <P style="color:black;background-color:#8ac8d6 ;font-size: 15pt; margin:5px auto;text-align:left;padding-left: 30px;margin : 0">

      <a href="https://thirdi.looker.com/dashboards/102?Year={{ _filters['hr_dates.yearvalue'] | url_encode }}" target="_blank" style="color:White;padding-bottom: 30px;padding-top: 18px;margin:5px auto;"><big>Overview  ➔</big></a>&emsp;&emsp;

      <a href=" https://thirdi.looker.com/dashboards/110?Department={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year+={{ _filters['hr_dates.yearvalue'] | url_encode }}" target="_blank"style="color:White"><big>Departments  ➔</big></a>&emsp;&emsp;

      <a href=" https://thirdi.looker.com/dashboards/107" target="_blank" style="color:White"><big>Historical  ➔</big></a>&emsp;&emsp;

      <a href="https://thirdi.looker.com/dashboards/112?Department+={{ _filters['hr_subdepartment.department_name'] | url_encode }}&Year={{ _filters['hr_dates.yearvalue'] | url_encode }}&Month=Dec" target="_blank" style="color:White"><big>Monthly Analysis   ➔</big></a>&emsp;&emsp;

      </p>
      </body>
      </html>;;
  }

}
