view: game_finance_derived {

    derived_table: {
      explore_source: ga_dim_date {
        column: roi_target_percent { field: ga_finance.roi_target_percent }
        column: date__date { field: ga_finance.date__date }
        column: date__month { field: ga_finance.date__month }
        column: date__quarter { field: ga_finance.date__quarter }
        column: date__week { field: ga_finance.date__week }
        column: date__year { field: ga_finance.date__year }
        column: avg_session_length_sec { field: ga_finance.avg_session_length_sec }


        derived_column: row_no {
          sql: row_number() over(order by date__date desc ) ;;
        }

      }
    }
    dimension: row_no {
      type: number
      primary_key: yes
    }
    dimension: roi_target_percent {
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
    dimension: date__week {
      description: ""
      type: date_week
    }
    dimension: date__year {
      description: ""
      type: date_year
    }
  dimension: avg_session_length_sec {
    description: ""
    type: number
  }
  measure: ROI_Target_Percent {
    type: average
    sql: ${roi_target_percent};;
    value_format: "0.00\%"
  }
  measure: Avg._Session_Length {
    type: average
    sql: ${avg_session_length_sec} ;;
  }
  }
