view: hr_employee {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".HR_EMPLOYEE
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
    sql: ${TABLE}.DEPTID ;;
  }

  dimension: doj {
    type: date
    sql:CAST(${TABLE}.DOJ AS date);;
    html: {{ rendered_value | date: "%d-%b-%y"}};;
  }
  dimension: yearofjoining {
    type: number
    sql: ${TABLE}.yearofjoining ;;
  }

  dimension: empid {
    type: number
    sql: ${TABLE}.EMPID ;;
  }

  dimension: employee_type {
    type: string
    sql: ${TABLE}.EMPLOYEE_TYPE ;;
  }

  # dimension: employee_type_1 {
  #   type: string
  #   sql: ${TABLE}.EMPLOYEE_TYPE ;;

  #   link: {

  #     label: "Link Label"

  #     url:

  #     " {% if _explore._name == 'hr_employee' %}

  #     https://thirdi.looker.com/dashboards/102?Yearvalue=2018

  #     {% endif %}  "

  #   }

  # }


  dimension: employee_type_2 {
    type: string
    sql: ${TABLE}.EMPLOYEE_TYPE ;;

    link: {

      label: "Link Label"

      url:

      " https://thirdi.looker.com/dashboards/102?Yearvalue=2018&Employee+Type+2={{ _filters['hr_employee.employee_type_2']}} "

    }

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
  measure: YOY_Change {
    type: number
    sql:( ${EmpCount_ThisYear}-${EmpCountLastYear})/ (${EmpCountLastYear})*10;;
    value_format: "0.00"
  }


  measure: Leavers_MTD {
    type: count
    # html:
    # # <html>
    # # <p style=" text-align:center;font-size:23px;">{{rendered_value}}</p>
    # # </html>
    # # ;;
  }


  dimension: leaving_date {
    type: date
    sql:CAST(${TABLE}.LEAVING_DATE AS date);;
    html: {{ rendered_value | date: "%d-%b-%y"}};;

  }

  dimension: mgrid {
    type: number
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
  measure: static_value{
    type: number
    sql: 67 ;;
    value_format: "0\%"
  }

  measure: count_of_new_Employees {
    type: count_distinct
    sql: CASE
         WHEN ${months_in_company}<=6 and
              ${months_in_company}<>0
         THEN  ${hr_employee.empid}
         END;;
    # html:
    # <html>
    # <p style=" text-align:center;font-size:23px;">{{rendered_value}}</p>
    # </html>
    # ;;
    }

    dimension: subdepartment {
      type:number
      sql: ${TABLE}.SUBDEPARTMENT ;;
    }

    measure: count {
      type: count
      drill_fields: [lastname, middlename, firstname]
    }
    measure: Count_of_Employees {
      type: count_distinct
      sql: ${TABLE}.EMPID;;
      # html:
      # <html>
      # <p style=" text-align:center;font-size:23px;">{{rendered_value}}</p>
      # </html>
      # ;;
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
      # html:
      # <html>
      # <p style=" text-align:center;font-size:23px;">{{rendered_value}}</p>
      # </html>
      # ;;
    }

    measure: Male_Percent
    {
      type: number
      sql: ${No_of_male_Employees}/(${No_of_female_Employees}+${No_of_male_Employees}) ;;
      value_format: "0.00%"
      # html:
      # <html>
      # <p style=" text-align:center;font-size:23px;">{{rendered_value}}</p>
      # </html>
      # ;;
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

    measure: Average_Age
    {
      type: average
      sql: ${age} ;;
      value_format: "0.00"
      # html:
      # <html>
      # <p style=" text-align:center;font-size:23px;">{{rendered_value}}</p>
      # </html>
      # ;;
    }

    measure: Age_Seniority
    {
      type: number
      sql: ${Avg_age_sen}/${Count_of_Employees} ;;
      value_format: "0.00%"
      # html:
      # <html>
      # <p style=" text-align:center;font-size:23px;">{{rendered_value}}</p>
      # </html>
      # ;;
    }



    measure:  New_employees_MTD{
      type: count

    }

    measure: Leavers_emp {
      type: sum
      # hidden: yes
      sql:  ${leavers_column} ;;
      filters: [leavers_column: "1"]

    }

    measure: Leavers_emp_2018 {
      type: sum
      hidden: yes
      sql:  ${leavers_column} ;;
      filters: [leavers_column: "1",hr_dates.datevalue: "2018"]

    }

    measure: Leavers_emp_2017 {
      type: sum
      hidden: yes
      sql: ${leavers_column} ;;
      filters: [leavers_column: "1",hr_dates.yearvalue: "2017"]
    }

    measure: Leavers_emp_2016 {
      type: sum
      hidden: yes
      sql: ${leavers_column} ;;
      filters: [leavers_column: "1",hr_dates.yearvalue: "2016"]
    }

    # measure: leavers_emp_ThisYear{
    #   type: sum
    #   hidden: no
    #   sql: ${leavers_column} ;;
    #   filters: [leavers_column: "1"]
    # }

    # measure: leavers_emp_LastYear1{
    #   type: sum
    #   hidden: no
    #   sql: ${leavers_column} ;;
    #   filters: [hr_dates.yearvalue: "hr_dates.yearvalue-1"]
    # }

    # measure: leavers_emp_last_Year1{
    #   type: sum
    #   sql: case when ${Year_Selector}='2018'
    #         then ${Leavers_emp_2017}
    #         case when ${Year_Selector}="2017"
    #         then ${Leavers_emp_2016}
    #         case when ${Year_Selector}='2016'
    #         then null

    # }



    measure: count_empid2018 {
      type: count_distinct
      sql: ${empid} ;;
      filters: [hr_dates.yearvalue: "2018"]
    }
    measure: count_empid2017 {
      type: count_distinct
      sql: ${empid} ;;
      filters: [hr_dates.yearvalue: "2017"]
    }
    measure: count_empid2016 {
      type: count_distinct
      sql: ${empid} ;;
      filters: [hr_dates.yearvalue: "2016"]
    }
    measure: turnoverrate_2018_empid{
      type: number
      hidden: no
      sql:  ${sum_leaverscolumn_2018}/replace(${count_empid2018},0,'1');;
    }
    measure: turnoverrate_2017_empid{
      type: number
      hidden: no
      sql:  ${sum_leaverscolumn_2017}/replace(${count_empid2017},0,'1');;
    }
    measure: turnoverrate_2016_empid{
      type: number
      hidden: no
      sql:  ${sum_leaverscolumn_2016}/replace(${count_empid2016},0,'1');;
    }
    measure: Turnover_Rate_ThisYear_empid {
      label_from_parameter: Year_Selector
      type: number
      sql:
          CASE
            WHEN {% parameter Year_Selector %} = '2016' THEN ${turnoverrate_2016_empid}
            WHEN {% parameter Year_Selector %} = '2017' THEN ${turnoverrate_2017_empid}
            WHEN {% parameter Year_Selector %} = '2018' THEN ${turnoverrate_2018_empid}
            ELSE NULL
          END ;;
      value_format: "0.00%"
    }
    measure: Turnover_Rate_LastYear_empid {
      label_from_parameter: Year_Selector
      type: number
      sql:
          CASE
            WHEN {% parameter Year_Selector %} = '2016' THEN NULL
            WHEN {% parameter Year_Selector %} = '2017' THEN ${turnoverrate_2016_empid}
            WHEN {% parameter Year_Selector %} = '2018' THEN ${turnoverrate_2017_empid}
            ELSE NULL
          END ;;
      value_format: "0.00"
    }

    # measure: count_leaversColumn_2018 {
    #   type: count
    #   hidden: no
    #   sql: ${leavers_column} ;;
    #   filters: [hr_dates.yearvalue: "2018"]
    # }
    # measure: count_leaversColumn_2018_1{
    #   type: count_distinct
    #   hidden: no
    #   sql: ${leavers_column} ;;
    #   filters: [hr_dates.yearvalue: "2018"]
    # }

    # measure: count_leaversColumn_2017 {
    #   type: count
    #   hidden: no
    #   sql: ${leavers_column} ;;
    #   filters: [hr_dates.yearvalue: "2017"]
    # }

    # measure: count_leaversColumn_2016 {
    #   type: count
    #   hidden: no
    #   sql: ${leavers_column} ;;
    #   filters: [hr_dates.yearvalue: "2016"]
    # }

    measure: sum_leaverscolumn_2018 {
      type: sum
      hidden: yes
      sql: ${leavers_column} ;;
      filters: [hr_dates.yearvalue: "2018"]
    }

    measure: sum_leaverscolumn_2017 {
      type: sum
      hidden: yes
      sql: ${leavers_column} ;;
      filters: [hr_dates.yearvalue: "2017"]
    }

    measure: sum_leaverscolumn_2016 {
      type: sum
      hidden: yes
      sql: ${leavers_column} ;;
      filters: [hr_dates.yearvalue: "2016"]
    }
    measure: sum_leaverscolumn {
      type: sum
      sql: ${leavers_column} ;;
    }
    # measure: count_leaversColumn {
    #   type: count
    #   sql: ${leavers_column} ;;
    # }
    measure: count_empid_leavers_column {
      type: count_distinct
      sql: ${empid} ;;
    }


    measure: turnoverrate{
      type: number
      sql: ${sum_leaverscolumn}/${count_empid_leavers_column};;
      value_format: "0.00%"
      # html:
      #   <html>
      #   <p style=" text-align:center;font-size:23px;">{{rendered_value}}</p>
      #   </html>
      #   ;;
    }


    # measure: turnoverrate_2018{
    #   type: number
    #   hidden: no
    #   sql:  ${sum_leaverscolumn_2018}/replace(${count_leaversColumn_2018},0,'1');;
    #       }

    # measure: turnoverrate_2017{
    #   type: number
    #   hidden: no
    #   sql:  ${sum_leaverscolumn_2017}/replace(${count_leaversColumn_2017},0,'1');;
    #   }

    # measure: turnoverrate_2016{
    #   type: number
    #   hidden: no
    #   sql:  ${sum_leaverscolumn_2016}/replace(${count_leaversColumn_2016},0,'1');;
    # }

    measure:count_of_empid_2018_Year {
      type:count_distinct
      hidden: yes
      sql:  CASE
          WHEN ${hr_dates.yearvalue}='2018'
          THEN ${hr_employee.empid}
          END ;;
    }

    measure: count_of_empid_2017_Year {
      type: count_distinct
      hidden: yes
      sql:  CASE
          WHEN ${hr_dates.yearvalue}='2017'
          THEN ${hr_employee.empid}
          END ;;
    }
    measure: count_of_empid_2016_Year {
      type: count_distinct
      hidden: yes
      sql:  CASE
        WHEN ${hr_dates.yearvalue}='2016'
        THEN ${hr_employee.empid}
      END ;;
    }




    parameter: Year_Selector{
      type: string
      hidden: no
      allowed_value: {
        label: "2016"
        value: "2016"

      }
      allowed_value: {
        label: "2017"
        value: "2017"
      }
      allowed_value: {
        label: "2018"
        value: "2018"
      }

    }
    measure: EmpCount_ThisYear {
      label_from_parameter: Year_Selector
      type: number
      sql:
      CASE
      WHEN {% parameter Year_Selector %} = '2016' THEN ${count_of_empid_2016_Year}
      WHEN {% parameter Year_Selector %} = '2017' THEN ${count_of_empid_2017_Year}
      WHEN {% parameter Year_Selector %} = '2018' THEN ${count_of_empid_2018_Year}
      ELSE NULL
    END ;;
    }

    measure: EmpCountLastYear {
      label_from_parameter: Year_Selector
      type: number
      sql:
      CASE
      WHEN {% parameter Year_Selector %} = '2016' THEN NULL
      WHEN {% parameter Year_Selector %} = '2017' THEN ${count_of_empid_2016_Year}
      WHEN {% parameter Year_Selector %} = '2018' THEN ${count_of_empid_2017_Year}
      ELSE NULL
    END ;;
    }

    measure: Leavers_Emp_ThisYear {
      label_from_parameter: Year_Selector
      type: number
      sql:
          CASE
            WHEN {% parameter Year_Selector %} = '2016' THEN ${Leavers_emp_2016}
            WHEN {% parameter Year_Selector %} = '2017' THEN ${Leavers_emp_2017}
            WHEN {% parameter Year_Selector %} = '2018' THEN ${Leavers_emp_2018}
            ELSE NULL
          END ;;
    }

    measure: Leavers_Emp_LastYear {
      label_from_parameter: Year_Selector
      type: number
      sql:
          CASE
            WHEN {% parameter Year_Selector %} = '2016' THEN NULL
            WHEN {% parameter Year_Selector %} = '2017' THEN ${Leavers_emp_2016}
            WHEN {% parameter Year_Selector %} = '2018' THEN ${Leavers_emp_2017}
            ELSE NULL
          END ;;
    }

    # measure: Turnover_Rate_ThisYear {
    #   label_from_parameter: Year_Selector
    #   type: number
    #   sql:
    #   CASE
    #     WHEN {% parameter Year_Selector %} = '2016' THEN ${turnoverrate_2016}
    #     WHEN {% parameter Year_Selector %} = '2017' THEN ${turnoverrate_2017}
    #     WHEN {% parameter Year_Selector %} = '2018' THEN ${turnoverrate_2018}
    #     ELSE NULL
    #   END ;;
    #   value_format: "0.00\%"
    # }

    # measure: Turnover_Rate_LastYear {
    #   label_from_parameter: Year_Selector
    #   type: number
    #   sql:
    #   CASE
    #     WHEN {% parameter Year_Selector %} = '2016' THEN NULL
    #     WHEN {% parameter Year_Selector %} = '2017' THEN ${turnoverrate_2016}
    #     WHEN {% parameter Year_Selector %} = '2018' THEN ${turnoverrate_2017}
    #     ELSE NULL
    #   END ;;
    # }





  }
