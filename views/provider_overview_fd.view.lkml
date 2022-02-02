view: provider_overview_fd {
  sql_table_name: "C##LOOKER".PROVIDER_OVERVIEW_FD
    ;;
  dimension: annual_spend {
    type: number
    sql: ${TABLE}.ANNUAL_SPEND ;;
    #value_format: "$0.00"

  }
  parameter: Default_provider {
    type: string
    allowed_value: {
      label: "lewis county"
      value:  "Lewis County General Hospital"
    }

  }

  dimension: default_provider {
    type: string
    sql:  ${TABLE}.{% parameter Default_provider %} ;;
  }

  dimension: prov_irs_num_tin {
    primary_key: yes
    type: number
    sql: ${TABLE}.PROV_IRS_NUM_TIN ;;
  }
  measure:  count_prov_irs_num_tin{
    type: count_distinct
    sql: ${TABLE}.prov_irs_num_tin ;;
  }

  measure: total_annual_spend {
    type: sum
    sql: ${annual_spend} ;;
    value_format: "$0.000,,\" M\""
    html:
    <p style="font-size:20px;font-weight: bold;">{{rendered_value}} </p>
    ;;
  }

  measure: Annual_spend_dollers {
    type: sum
    sql: ${annual_spend} ;;
    value_format: "$0"
  }

  measure: average_annual_spend {
    type: average
    sql: ${annual_spend} ;;
  }
  measure: sum_dummySavings {
    type: sum
    sql: ${dummy__savings} ;;
    value_format: "$0.00"
  }
  # measure: Members {
  #   type: sum
  #   sql: ${member_count} ;;
  # }
  dimension: distinct_npi_billed {
    type: number
    sql: ${TABLE}.DISTINCT_NPI_BILLED ;;
    html:
     <p style="font-size:20px;font-weight: bold;"><img src="https://img.icons8.com/ios/50/000000/hospital-3.png"width="30" height="30" />&emsp;{{rendered_value}}</p>
    ;;
  }

  dimension: dummy__savings {
    type: number
    sql: ${TABLE}.DUMMY__SAVINGS ;;
  }

  dimension: Provider {
    type: string
    sql: ${TABLE}.GROUPNAME ;;
    html:
    <p style="font-size:20px;font-weight: bold;">{{rendered_value}}</p>
    ;;
  }
  # dimension: URL {
  #   type: string
  #   sql: ${TABLE}.GROUPNAME ;;
  #   # link: {
  #   #   label: "Initiative Dashboard"
  #   #   url: "https://thirdi.looker.com/dashboards/108?Dummy%20Initiative%20Tag=&Year%20="
  #   # }
  #   html:
  #   <a href="https://thirdi.looker.com/dashboards/108?Dummy%20Initiative%20Tag=&Year%20= &f Provider=Lewis+County+General+Hospital"><font size="5" color="Black">Initiative Dashboard 🢂</font></a> </a>
  #   ;;
  # }
  # filter: provider_filter {
  #   type: string
  #   default_value: "Empire City Laboratories Inc"
  # }

  dimension: Members {
    type: number
    sql: ${TABLE}.MEMBER_COUNT ;;
    #value_format:"0,\" K\""
    html:
     <p style="font-size:20px;font-weight: bold;">
      <img src="https://img.icons8.com/ios/50/000000/conference-call--v1.png" width="30" height="30" />&emsp;{{rendered_value}} </p>
    ;;
  }
  # dimension: Members_testing {
  #   type: number
  #   sql: ${TABLE}.MEMBER_COUNT ;;
  #   html:
  #   <p style="font-size:20px;font-weight: bold;">
  #     <img src="https://img.icons8.com/ios/50/000000/conference-call--v1.png"  width="20" height="30" &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;/>  {{rendered_value}} </p>
  #   ;;
  # }



  dimension: savings_spend {
    type: number
    sql: ${TABLE}.SAVINGS_SPEND ;;
  }

  dimension: tin {
    type: string
    sql: ${TABLE}.TIN ;;
  }

  dimension: total_spend {
    type: number
    sql: ${TABLE}.TOTAL_SPEND ;;
  }

  measure: count {
    type: count
    drill_fields: [Provider]
  }
  dimension: annual_savings_Spend{
    type: number
    #value_format: "0%"
    sql: ${dummy__savings}/${annual_spend} ;;

  }
  # measure:  percent_annual_savings_Spend{
  #   type: percentile
  #   sql: ${TABLE}.${annual_savings_Spend} ;;
  # }



}
