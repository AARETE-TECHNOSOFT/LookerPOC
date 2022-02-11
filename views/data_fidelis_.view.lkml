# The name of this view in Looker is "Data Fidelis "

view: data_fidelis_ {

  sql_table_name: "C##LOOKER".DATA_FIDELIS_
    ;;

  dimension: ancillaryprofessionalservicety {
    type: string
    sql: ${TABLE}.ANCILLARYPROFESSIONALSERVICETY ;;

  }

  dimension: claim_cnt {
    label: "Claim Count"
    type: string
    sql: ${TABLE}.CLAIM_CNT ;;
  }
  measure: Total_claim_cnt {
    label: "Claim Count"
    type: sum
    sql: ${TABLE}.claim_cnt ;;
  }

  dimension: claim_form_type_cd {
    type: string
    sql: ${TABLE}.CLAIM_FORM_TYPE_CD ;;
  }

  dimension: cpt4_proc_cd {
    type: string
    sql: ${TABLE}.CPT4_PROC_CD ;;
  }

  dimension: cpt4_proc_desc {
    type: string
    sql: ${TABLE}.CPT4_PROC_DESC ;;
  }

  dimension: cxt_edit {
    label: "Initiative"
    type: string
    sql: ${TABLE}.CXT_EDIT ;;
  }

  dimension: cxt_excd {
    type: string
    sql: ${TABLE}.CXT_EXCD ;;
  }
  dimension_group: dos_year_mon {
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
    sql: ${TABLE}.DOS_YEAR_MON ;;
  }

  dimension: dos_year_month {
    type: string
    sql: ${TABLE}.DOS_YEAR_MONTH ;;
  }
  dimension: Dos_Month_Year {
    type: string
    sql: to_char(to_date(${dos_year_mon_date},'yyyy-dd-mm'),'Mon') || ' ' ||
      extract(year from to_date(${dos_year_mon_date},'yyyy-dd-mm')) ;;
  }
  dimension: Year_
  {
    type: string
    sql: extract(year from to_date(${dos_year_mon_date},'yyyy-dd-mm')) ;;
  }

  dimension: dummy__savings {
    type: number
    sql: ${TABLE}.DUMMY__SAVINGS ;;
  }

  measure: sum_dummy_savings_HTML
  {
    type: sum
    sql: ${TABLE}.dummy__savings ;;
    #value_format:"$0.000,,\" M\""
    value_format:"$0,\" K\""
    html:
    <p style="font-size:20px;font-weight: bold;">{{rendered_value}} </p>
    ;;
  }
  measure: sum_dummy_savings
  {
    type: sum
    sql: ${TABLE}.dummy__savings ;;
    value_format:"$0,\" K\""
  }
  measure: sum_dummy_saving_M
  {
    type: sum
    sql: ${TABLE}.dummy__savings ;;
    value_format:"$0.000,,\" M\""
    html:
    <p style="font-size:20px background-color:powderblue;font-weight: bold;">{{rendered_value}}</p>;;
  }
  measure: sum_dummy_savings_Dollers
  {
    type: sum
    sql: ${TABLE}.dummy__savings ;;
    value_format:"$0"
  }
  measure: DummySavings_Total {
    label: "Total Savings"
    type: sum
    sql: ${TABLE}.dummy__savings ;;
    #value_format:"$0"
  }


  dimension: dummy_initiative_tag {
    type: string
    sql: ${TABLE}.DUMMY_INITIATIVE_TAG ;;
    html:
    <p style="font-size:20px;font-weight: bold;">{{rendered_value}}</p>
    ;;
  }

  dimension: dummy_initiative_TAG {
    label: "Initiative Tag"
    type: string
    sql: ${TABLE}.DUMMY_INITIATIVE_TAG ;;

  }
  dimension: excd {
    label: "EXCD"
    type: string
    sql: ${TABLE}.EXCD ;;
  }

  dimension: groupname {
    label: "Name"
    type: string
    sql: ${TABLE}.GROUPNAME ;;
  }

  dimension: place_of_svc_cd {
    type: string
    sql: ${TABLE}.PLACE_OF_SVC_CD ;;
  }

  dimension: program_desc {
    type: string
    sql: ${TABLE}.PROGRAM_DESC ;;
  }

  dimension: program_desc_ii {
    type: string
    sql: ${TABLE}.PROGRAM_DESC_II ;;
  }

  dimension: prov_county {
    type: string
    sql: ${TABLE}.PROV_COUNTY ;;
  }

  dimension: prov_irs_num {
    type: string
    sql: ${TABLE}.PROV_IRS_NUM ;;
  }

  dimension: prov_npi {
    type: string
    sql: ${TABLE}.PROV_NPI ;;
  }

  dimension: prov_specialty_2 {
    type: string
    sql: ${TABLE}.PROV_SPECIALTY_2 ;;
  }

  dimension: prov_type_desc {
    type: string
    sql: ${TABLE}.PROV_TYPE_DESC ;;
  }

  dimension: sum_allwd_amt {
    type: string
    sql: ${TABLE}.SUM_ALLWD_AMT ;;
  }

  dimension: sum_billed_amt {
    type: string
    sql: ${TABLE}.SUM_BILLED_AMT ;;
  }

  dimension: sum_paid_amt {
    type: string
    sql: ${TABLE}.SUM_PAID_AMT ;;
  }

  dimension: sum_unit_cnt {
    type: string
    sql: ${TABLE}.SUM_UNIT_CNT ;;
  }

  dimension: total_allwd_amt {
    type: number
    sql: ${TABLE}.TOTAL_ALLWD_AMT ;;
  }
  measure: count_prov_irs_num {
    type: count_distinct
    sql: ${TABLE}.prov_irs_num ;;
  }
  measure: total_total_allwd_amt {
    type: sum
    sql: ${total_allwd_amt} ;;
  }

  measure: average_total_allwd_amt {
    type: average
    sql: ${total_allwd_amt} ;;
  }

  dimension: total_billed_amt {
    label: "Total Billed"
    type: number
    sql: ${TABLE}.TOTAL_BILLED_AMT ;;
  }
  measure: Total_billed_amt_ {
    label: "Total Billed"
    type: sum
    sql: ${TABLE}.total_billed_amt ;;
    value_format: "$0000"
  }

  dimension: total_paid_amt {
    label: "Total Paid"
    type: number
    sql: ${TABLE}.TOTAL_PAID_AMT ;;
  }

  measure: total_paid_amt_ {
    label: "Total Paid"
    type: sum
    sql: ${TABLE}.total_billed_amt ;;
    value_format: "$0000"
  }

  measure: count {
    type: count
    drill_fields: [groupname]
  }
  measure: LinkToAnotherDash {
    label: "Click To Jump on Next Dashboard"
    link: {
      label: "Click Here"
      url: "https://thirdi.looker.com/dashboards/108?Dummy%20Initiative%20Tag=&Year%20="
    }
  }
}
