# The name of this view in Looker is "Hra Employee"
view: hra_employee {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".HRA_EMPLOYEE
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.AGE ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age {
    type: sum
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
    value_format_name: decimal_2
    html:
    <html>
    <p style=" text-align:center;font-size:34px;">{{rendered_value}}</p>
    </html>
    ;;
  }

  dimension: avg_seniority {
    type: number
    sql: ${TABLE}.AVG_SENIORITY ;;
  }

  dimension: ctc {
    type: number
    sql: ${TABLE}.CTC ;;
  }

  dimension: deptid {
    type: number
    value_format_name: id
    sql: ${TABLE}.DEPTID ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: doj {
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
    sql: ${TABLE}.DOJ ;;
  }

  dimension: empid {
    type: number
    value_format_name: id
    sql: ${TABLE}.EMPID ;;
  }

  dimension: employee_type {
    type: string
    sql: ${TABLE}.EMPLOYEE_TYPE ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.FIRSTNAME ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.GENDER ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.LASTNAME ;;
  }

  dimension: leavers_column {
    type: number
    sql: ${TABLE}.LEAVERS_COLUMN ;;
  }

  dimension_group: leaving {
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
    sql: ${TABLE}.LEAVING_DATE ;;
  }

  dimension: mgrid {
    type: number
    value_format_name: id
    sql: ${TABLE}.MGRID ;;
  }

  dimension: middlename {
    type: string
    sql: ${TABLE}.MIDDLENAME ;;
  }

  dimension: months_in_company {
    type: number
    sql: ${TABLE}.MONTHS_IN_COMPANY ;;
  }

  dimension: new_employees {
    type: number
    sql: ${TABLE}.NEW_EMPLOYEES ;;
  }

  dimension: subdepartment {
    type: number
    sql: ${TABLE}.SUBDEPARTMENT ;;
  }

  measure: count {
    type: count
    drill_fields: [lastname, middlename, firstname]
  }

  measure: count_of_emp {
    type: count_distinct
    sql: ${TABLE}.empid;;
    }


  measure:Overview_NoOfOpenPositions_tab{
    sql: 1 ;;
    html:
    <html>
    <body>
      <table style="width:100%;height:50%;line-height:1.5;align:center;font-size:14px;padding-left: 30px;padding-top: 20px;padding-bottom: 15px;background-color: #ffffff;border-radius: 5px; " >

      <tr>


      <td rowspan="2" style="text-align:left;width:200px;padding-top:10px;font-size:15px;padding-left:30px;rowspan="2">
      Number Of Open Positions<br><b style="font-size:30px;">{{der_mon_ana_new.No_of_Open_Positions._rendered_value}}</b>
      </td>

      <td style="text-align:left;width:200px;border-left-style:solid;line-height:1.0;padding-top:10px;font-size:15px;padding-left:30px;">
      Contract/Temp<br><b style="font-size:30px;">{{der_mon_ana_new.Permanent_Positions._rendered_value}}</b>
      </td>

      </tr>

       <tr>

      <td style="text-align:left;width:200px;border-left-style: solid;padding-top:10px;font-size:15px;padding-left:30px;">
      Permanent<br><b style="font-size:30px;">{{der_mon_ana_new.Contract_Positions._rendered_value}}</b>
      </td>
      </tr>

      </table>

      </body>
      </html>
      ;;
  }




  measure:Leavers {
    type: count_distinct
    sql: ${TABLE}.empid;;
    filters: [leavers_column: "1"]
     }

  measure: count_of_new_emp {
    type: count_distinct
   sql: CASE
    WHEN ${months_in_company}<=6 and
    ${months_in_company}<>0
    THEN  ${hra_employee.empid}
    END;;
  }


  measure: sum_leaverscolumn {
    type: sum
    sql: ${leavers_column} ;;
  }

  measure: count_empid_leavers_column {
    type: count_distinct
    sql: ${empid} ;;
  }

  measure: turnoverrate{
    type: number
    sql: ${sum_leaverscolumn}/${count_empid_leavers_column};;
    value_format: "0.00%"
  }


  dimension: Avg_age {
    type: yesno
    sql: ${age}>45 AND ${age}<58 ;;
  }

  measure: Avg_age_sen
  {
    type: count
    filters: [Avg_age: "yes"]
  }

  measure: Age_Seniority
  {
    type: number
    sql: ${Avg_age_sen}/${count_of_emp} ;;
    value_format: "0.00%"
   }

  measure: No_of_female_Employees
  {
    type: count
    filters: [gender: "Female"]
  }

  measure: No_of_male_Employees
  {
    type: count
    filters: [gender: "Male"]
  }

  measure: Female_Percent
  {
    type: number
    sql: ${No_of_female_Employees}/(${No_of_female_Employees}+${No_of_male_Employees}) ;;
    value_format: "0.00%"
  }

  measure: Male_Percent
  {
    type: number
    sql: ${No_of_male_Employees}/(${No_of_female_Employees}+${No_of_male_Employees}) ;;
    value_format: "0.00%"
  }

  measure: Leavers_emp {
    type: sum
    # hidden: yes
    sql:  ${leavers_column} ;;
    filters: [leavers_column: "1"]

  }

  measure:count_of_empid_2021_Year {
    type:count_distinct
    hidden: yes
    sql:  CASE
          WHEN ${hra_dates.yearvalue}='2021'
          THEN ${hra_employee.empid}
          END ;;
  }

  measure:count_of_empid_2020_Year {
    type:count_distinct
    hidden: yes
    sql:  CASE
          WHEN ${hra_dates.yearvalue}='2020'
          THEN ${hra_employee.empid}
          END ;;
  }

  measure:count_of_empid_2019_Year {
    type:count_distinct
    hidden: yes
    sql:  CASE
          WHEN ${hra_dates.yearvalue}='2019'
          THEN ${hra_employee.empid}
          END ;;
  }


  parameter: Year_Selector
  {
    type: string
    hidden: no
    allowed_value: {
      label: "2019"
      value: "2019"

    }
    allowed_value: {
      label: "2020"
      value: "2020"
    }
    allowed_value: {
      label: "2021"
      value: "2021"
    }
   }


  measure: EmpCount_ThisYear {
    label_from_parameter: Year_Selector
    type: number
    sql:
      CASE
      WHEN {% parameter Year_Selector %} = '2019' THEN ${count_of_empid_2019_Year}
      WHEN {% parameter Year_Selector %} = '2020' THEN ${count_of_empid_2020_Year}
      WHEN {% parameter Year_Selector %} = '2021' THEN ${count_of_empid_2021_Year}
      ELSE NULL
    END ;;
  }

  measure: EmpCountLastYear {
    label_from_parameter: Year_Selector
    type: number
    sql:
      CASE
      WHEN {% parameter Year_Selector %} = '2019' THEN NULL
      WHEN {% parameter Year_Selector %} = '2020' THEN ${count_of_empid_2019_Year}
      WHEN {% parameter Year_Selector %} = '2021' THEN ${count_of_empid_2020_Year}
      ELSE NULL
    END ;;
  }


  measure: count_empid2021 {
    type: count_distinct
    sql: ${empid} ;;
    filters: [hra_dates.yearvalue: "2021"]
  }
  measure: count_empid2020 {
    type: count_distinct
    sql: ${empid} ;;
    filters: [hra_dates.yearvalue: "2020"]
  }
  measure: count_empid2019 {
    type: count_distinct
    sql: ${empid} ;;
    filters: [hra_dates.yearvalue: "2019"]
  }

  measure: sum_leaverscolumn_2021 {
    type: sum
    hidden: yes
    sql: ${leavers_column} ;;
    filters: [hra_dates.yearvalue: "2021"]
  }

  measure: sum_leaverscolumn_2020 {
    type: sum
    hidden: yes
    sql: ${leavers_column} ;;
    filters: [hra_dates.yearvalue: "2020"]
  }

  measure: sum_leaverscolumn_2019 {
    type: sum
    hidden: yes
    sql: ${leavers_column} ;;
    filters: [hra_dates.yearvalue: "2019"]
  }

  measure: turnoverrate_2021_empid{
    type: number
    hidden: no
    sql:  ${sum_leaverscolumn_2021}/replace(${count_empid2021},0,'1');;
  }
  measure: turnoverrate_2020_empid{
    type: number
    hidden: no
    sql:  ${sum_leaverscolumn_2020}/replace(${count_empid2020},0,'1');;
  }
  measure: turnoverrate_2019_empid{
    type: number
    hidden: no
    sql:  ${sum_leaverscolumn_2019}/replace(${count_empid2019},0,'1');;
  }
  measure: Turnover_Rate_ThisYear_empid {
    label_from_parameter: Year_Selector
    type: number
    sql:
          CASE
            WHEN {% parameter Year_Selector %} = '2019' THEN ${turnoverrate_2019_empid}
            WHEN {% parameter Year_Selector %} = '2020' THEN ${turnoverrate_2020_empid}
            WHEN {% parameter Year_Selector %} = '2021' THEN ${turnoverrate_2021_empid}
            ELSE NULL
          END ;;
    value_format: "0.00%"
  }
  measure: Turnover_Rate_LastYear_empid {
    label_from_parameter: Year_Selector
    type: number
    sql:
          CASE
            WHEN {% parameter Year_Selector %} = '2019' THEN NULL
            WHEN {% parameter Year_Selector %} = '2020' THEN ${turnoverrate_2019_empid}
            WHEN {% parameter Year_Selector %} = '2021' THEN ${turnoverrate_2020_empid}
            ELSE NULL
          END ;;
    value_format: "0.00"
  }

  measure: Leavers_emp_2021 {
    type: sum
    hidden: yes
    sql:  ${leavers_column} ;;
    filters: [leavers_column: "1",hra_dates.yearvalue: "2021"]

  }

  measure: Leavers_emp_2020 {
    type: sum
    hidden: yes
    sql: ${leavers_column} ;;
    filters: [leavers_column: "1",hra_dates.yearvalue: "2020"]
  }

  measure: Leavers_emp_2019 {
    type: sum
    hidden: yes
    sql: ${leavers_column} ;;
    filters: [leavers_column: "1",hra_dates.yearvalue: "2019"]
  }

  measure: Leavers_Emp_ThisYear {
    label_from_parameter: Year_Selector
    type: number
    sql:
          CASE
            WHEN {% parameter Year_Selector %} = '2019' THEN ${Leavers_emp_2019}
            WHEN {% parameter Year_Selector %} = '2020' THEN ${Leavers_emp_2020}
            WHEN {% parameter Year_Selector %} = '2021' THEN ${Leavers_emp_2021}
            ELSE NULL
          END ;;
  }

  measure: Leavers_Emp_LastYear {
    label_from_parameter: Year_Selector
    type: number
    sql:
          CASE
            WHEN {% parameter Year_Selector %} = '2019' THEN NULL
            WHEN {% parameter Year_Selector %} = '2020' THEN ${Leavers_emp_2019}
            WHEN {% parameter Year_Selector %} = '2021' THEN ${Leavers_emp_2020}
            ELSE NULL
          END ;;
  }



  filter: Year_filter {
    type: string
    #suggestions: ["01-02-2020"]
    suggestions: ["2019","2020","2021"]
  }


  measure: EmpCount_This_Year_New{
    type: count_distinct
    sql: case when {% condition Year_filter %} ${hra_dates.datevalue_year} {% endcondition %} then ${hra_employee.empid} end ;;
  }

  measure: EmpCount_Last_Year_New {
    type: count_distinct
    sql: CASE WHEN {% condition Year_filter %}  To_char(ADD_MONTHS(to_date(${hra_dates.datevalue_date},'yyyy-mm-dd'),12),'yyyy')
      {% endcondition %} THEN ${hra_employee.empid} end ;;
  }

  measure: YOY_Change {
    type: number
    sql: ((${EmpCount_This_Year_New}-${EmpCount_Last_Year_New})/nullif(${EmpCount_Last_Year_New},0))*10;;
    value_format: "0.00"
  }


  measure: Leavers_EmpCount_This_Year{
    type: sum
    sql: case when {% condition Year_filter %} ${hra_dates.datevalue_year} {% endcondition %} then ${leavers_column} end ;;
    filters: [leavers_column: "1"]
  }

  measure: Leavers_EmpCount_Last_Year{
    type: sum
    sql: CASE WHEN {% condition Year_filter %}  To_char(ADD_MONTHS(to_date(${hra_dates.datevalue_date},'yyyy-mm-dd'),12),'yyyy')
      {% endcondition %} THEN ${leavers_column} end ;;
      filters: [leavers_column: "1"]
  }

  measure: TurnOver_Rate_EmpCount_This_Year{
    type: number
    sql: case when {% condition Year_filter %} ${hra_dates.datevalue_year} {% endcondition %} then ${Leavers_EmpCount_This_Year}/replace(${EmpCount_This_Year_New},0,'1') end ;;
    value_format: "0.00%"
  }

  measure: TurnOver_Rate_EmpCount_Last_Year{
    type: number
    sql: CASE WHEN {% condition Year_filter %}  To_char(ADD_MONTHS(to_date(${hra_dates.datevalue_date},'yyyy-mm-dd'),12),'yyyy')
      {% endcondition %} THEN ${Leavers_EmpCount_This_Year}/replace(${EmpCount_This_Year_New},0,'1') end ;;
    value_format: "0.00"
  }


  dimension: ThisYear_LastYear {
    type: string
    sql:
          CASE
            WHEN {% parameter Year_filter %} = '2019' THEN '19-18'
            WHEN {% parameter Year_filter %} = '2020' THEN '20-19'
            WHEN {% parameter Year_filter %} = '2021' THEN '21-20'
            ELSE NULL
          END ;;
  }

 measure: TurnOver {
   type: number
   sql: ${Leavers_emp}/${count_of_emp} ;;
  value_format: "0.00%"

 }

}
