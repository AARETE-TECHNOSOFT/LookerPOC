view: performance_pdt {
  derived_table: {
    indexes: ["proposalid"]
    datagroup_trigger: lookerpoc_default_datagroup
     sql:
          SELECT p1.*, rank() over (partition by proposalid, proposalstatus order by creditingperiodenddate) as closed_won_quarter
          FROM performance_reporting p1
          UNION ALL
          SELECT p2.*, rank() over (partition by proposalid, proposalstatus order by creditingperiodenddate) as closed_won_quarter
          FROM performance_reporting_south p2
      ;;
  }

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: ${proposalid} || ${creditingregion} || ${creditingperiodkey} || ${productname} || ${componenttype} || ${productstart_date} || ${productend_date} || ${salesmanagerid} || ${component};;
  }

  dimension: closed_won_quarter {
    type: number
    sql: ${TABLE}.closed_won_quarter ;;
  }

  dimension: accountregion {
    type: string
    sql: ${TABLE}.ACCOUNTREGION ;;
  }

  dimension: asofquarter {
    type: number
    sql: ${TABLE}.ASOFQUARTER ;;
  }

  dimension: quarterly_yearly_component {
    type: string
    sql: ${TABLE}.creditingperiod || ' Report';;
    #hidden: yes
    #label: "Crediting Period"
    link: {
      label: "Team Detailed Report"
      url: "https://thirdi.looker.com/dashboards/41?Region={{ performance_pdt.creditingregion._filterable_value }}
      &Crediting Period={{ performance_pdt.creditingperiod._filterable_value }}
      &Crediting Year={{ performance_pdt.creditingyear._filterable_value }}"
    }
    html: <u>{{ linked_value  }}</u>;;
  }

  dimension: asofyear {
    type: number
    sql: ${TABLE}.ASOFYEAR ;;
  }

  dimension: billingcountry {
    label: "Country"
    type: string
    sql: ${TABLE}.BILLINGCOUNTRY ;;
    map_layer_name: countries
    link: {
      label: "State wise performance"
      url: "https://thirdi.looker.com/dashboards/43?Country={{ performance_pdt.billingcountry._filterable_value }}
      &Crediting Period={{ performance_pdt.creditingperiod._filterable_value }}
      &Crediting Year={{ performance_pdt.creditingyear._filterable_value }}"
    }
    html: <u>{{ linked_value  }}</u>;;
  }

  dimension: billingstate {
    label: "State"
    type: string
    sql: ${TABLE}.BILLINGSTATE ;;
    map_layer_name: us_states
  }

  dimension: billtoaccountid {
    type: string
    sql: ${TABLE}.BILLTOACCOUNTID ;;
  }

  dimension: billtoaccountname {
    type: string
    sql: ${TABLE}.BILLTOACCOUNTNAME ;;
  }

  dimension: billtoupflag {
    type: string
    sql: ${TABLE}.BILLTOUPFLAG ;;
  }

  dimension: bundletype {
    type: string
    sql: ${TABLE}.BUNDLETYPE ;;
  }

  dimension_group: businesswon {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.BUSINESSWONDATE ;;
  }

  dimension: component {
    type: string
    sql: ${TABLE}.COMPONENT ;;
  }

  dimension: componentcategory {
    type: string
    sql: ${TABLE}.COMPONENTCATEGORY ;;
  }

  dimension: componenttype {
    type: string
    sql: ${TABLE}.COMPONENTTYPE ;;
  }

  dimension: creditingperiod {
    type: string
    sql: ${TABLE}.CREDITINGPERIOD ;;
  }

  dimension_group: creditingperiodend {
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
    sql: ${TABLE}.CREDITINGPERIODENDDATE ;;
  }

  dimension: creditingperiodkey {
    type: number
    sql: ${TABLE}.CREDITINGPERIODKEY ;;
  }

  dimension_group: creditingperiodstart {
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
    sql: ${TABLE}.CREDITINGPERIODSTARTDATE ;;
  }

  dimension: creditingperiodvpdirector {
    type: string
    sql: ${TABLE}.CREDITINGPERIODVPDIRECTOR ;;
  }

  dimension: creditingregion {
    type: string
    sql: ${TABLE}.CREDITINGREGION ;;
    link: {
      label: "Team Detailed dashboard"
      url: "https://thirdi.looker.com/dashboards/40?Region={{ performance_pdt.creditingregion._filterable_value }}
      &Crediting Period={{ performance_pdt.creditingperiod._filterable_value }}
      &Crediting Year={{ performance_pdt.creditingyear._filterable_value }}"
    }
  }

  dimension: creditingregionecs {
    type: string
    sql: ${TABLE}.CREDITINGREGIONECS ;;
  }

  dimension: creditingregionfordashboard {
    type: string
    sql: ${TABLE}.CREDITINGREGIONFORDASHBOARD ;;
  }

  dimension: creditingregionindividual {
    type: string
    sql: ${TABLE}.CREDITINGREGIONINDIVIDUAL ;;
  }

  dimension: creditingregionspif {
    type: string
    sql: ${TABLE}.CREDITINGREGIONSPIF ;;
  }

  dimension: creditingyear {
    type: number
    sql: ${TABLE}.CREDITINGYEAR ;;
  }

  dimension: directorid {
    type: string
    sql: ${TABLE}.DIRECTORID ;;
  }

  dimension: directorlink {
    type: string
    sql: ${TABLE}.DIRECTORLINK ;;
  }

  dimension: directornamedashboard {
    type: string
    sql: ${TABLE}.DIRECTORNAMEDASHBOARD ;;
  }

  dimension_group: effyearend {
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
    sql: ${TABLE}.EFFYEARENDDATE ;;
  }

  dimension_group: effyearstart {
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
    sql: ${TABLE}.EFFYEARSTARTDATE ;;
  }

  dimension: individualcreditingregion {
    type: string
    sql: ${TABLE}.INDIVIDUALCREDITINGREGION ;;
  }

  dimension: insidecreditingregion {
    type: string
    sql: ${TABLE}.INSIDECREDITINGREGION ;;
  }

  dimension: isnewrep {
    type: string
    sql: ${TABLE}.ISNEWREP ;;
  }

  dimension: isspif1_component {
    type: number
    sql: ${TABLE}.ISSPIF1COMPONENT ;;
  }

  dimension: isstreaming {
    type: string
    sql: ${TABLE}.ISSTREAMING ;;
  }

  dimension: masterproposalid {
    type: string
    sql: ${TABLE}.MASTERPROPOSALID ;;
  }

  dimension_group: masterproposalwon {
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
    sql: ${TABLE}.MASTERPROPOSALWONDATE ;;
  }

  dimension: maxfromdate {
    type: string
    sql: ${TABLE}.MAXFROMDATE ;;
  }

  dimension: pdbillingoptions {
    type: string
    sql: ${TABLE}.PDBILLINGOPTIONS ;;
  }

  dimension: productcategory {
    type: string
    sql: ${TABLE}.PRODUCTCATEGORY ;;
  }

  dimension: productclass {
    type: string
    sql: ${TABLE}.PRODUCTCLASS ;;
  }

  dimension_group: productend {
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
    sql: ${TABLE}.PRODUCTENDDATE ;;
  }

  dimension: productname {
    type: string
    sql: ${TABLE}.PRODUCTNAME ;;
  }

  dimension_group: productstart {
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
    sql: ${TABLE}.PRODUCTSTARTDATE ;;
  }

  dimension: producttype {
    type: string
    sql: ${TABLE}.PRODUCTTYPE ;;
  }

  dimension_group: proposalexpectedend {
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
    sql: ${TABLE}.PROPOSALEXPECTEDENDDATE ;;
  }

  dimension_group: proposalexpectedstart {
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
    sql: ${TABLE}.PROPOSALEXPECTEDSTARTDATE ;;
  }

  dimension: proposalid {
    type: string
    sql: ${TABLE}.PROPOSALID ;;
  }

  dimension: proposalidforsalesforce {
    type: string
    sql: ${TABLE}.PROPOSALIDFORSALESFORCE ;;
  }

  dimension: proposalname {
    type: string
    sql: ${TABLE}.PROPOSALNAME ;;
  }

  dimension: proposalphase {
    type: string
    sql: ${TABLE}.PROPOSALPHASE ;;
  }

  dimension: proposalstatus {
    type: string
    sql: ${TABLE}.PROPOSALSTATUS ;;
  }

  dimension_group: quarterend {
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
    sql: ${TABLE}.QUARTERENDDATE ;;
  }

  dimension: qycomponentindividual {
    type: string
    sql: ${TABLE}.QYCOMPONENTINDIVIDUAL ;;
  }

  dimension: qycomponentrepdirector {
    type: string
    sql: ${TABLE}.QYCOMPONENTREPDIRECTOR ;;
  }

  dimension: regiondirectorid {
    type: string
    sql: ${TABLE}.REGIONDIRECTORID ;;
  }

  dimension: regiondirectorname {
    type: string
    sql: ${TABLE}.REGIONDIRECTORNAME ;;
  }

  dimension: repdirectorlink {
    type: string
    sql: ${TABLE}.REPDIRECTORLINK ;;
  }

  dimension: repdirectorname {
    type: string
    sql: ${TABLE}.REPDIRECTORNAME ;;
  }

  dimension: repdirectornamedashboard {
    type: string
    sql: ${TABLE}.REPDIRECTORNAMEDASHBOARD ;;
  }

  dimension: repemail {
    type: string
    sql: ${TABLE}.REPEMAIL ;;
  }

  dimension: salesmanager {
    type: string
    sql: ${TABLE}.SALESMANAGER ;;
    link: {
      label: "Individual Detailed dashboard"
      url: "https://thirdi.looker.com/dashboards/51?Region={{ performance_pdt.creditingregion._filterable_value }}
      &Crediting Period={{ performance_pdt.creditingperiod._filterable_value }}
      &Crediting Year={{ performance_pdt.creditingyear._filterable_value }}
      &Sales Manager={{ performance_pdt.salesmanager._filterable_value }}"
    }
  }

  dimension: salesmanagerforspif {
    type: string
    sql: ${TABLE}.SALESMANAGERFORSPIF ;;
  }

  dimension: salesmanagerid {
    type: string
    sql: ${TABLE}.SALESMANAGERID ;;
  }

  dimension: salesmanagernamedashboard {
    type: string
    sql: ${TABLE}.SALESMANAGERNAMEDASHBOARD ;;
  }

  dimension: salesregion {
    type: string
    sql: ${TABLE}.SALESREGION ;;
  }

  dimension: salesrepforcreditingregion {
    type: string
    sql: ${TABLE}.SALESREPFORCREDITINGREGION ;;
  }

  dimension: salesrepteam {
    type: string
    sql: ${TABLE}.SALESREPTEAM ;;
  }

  dimension: salesteam {
    type: string
    sql: ${TABLE}.SALESTEAM ;;
  }

  dimension: salesteamcustomsort {
    type: number
    sql: ${TABLE}.SALESTEAMCUSTOMSORT ;;
  }

  dimension: salesteamrenewals {
    type: string
    sql: ${TABLE}.SALESTEAMRENEWALS ;;
  }

  dimension: selltoaccountid {
    type: string
    sql: ${TABLE}.SELLTOACCOUNTID ;;
  }

  dimension: selltoaccountname {
    type: string
    sql: ${TABLE}.SELLTOACCOUNTNAME ;;
  }

  dimension: selltocountry {
    type: string
    sql: ${TABLE}.SELLTOCOUNTRY ;;
    map_layer_name: countries
  }

  dimension: selltostate {
    type: string
    sql: ${TABLE}.SELLTOSTATE ;;
    map_layer_name: us_states
  }

  dimension: soldtoupflag {
    type: string
    sql: ${TABLE}.SOLDTOUPFLAG ;;
  }

  dimension: streamingdigital {
    type: string
    sql: ${TABLE}.STREAMINGDIGITAL ;;
  }

  dimension: teamcreditedregion {
    type: string
    sql: ${TABLE}.TEAMCREDITEDREGION ;;
  }

  dimension: teammemberrole {
    type: string
    sql: ${TABLE}.TEAMMEMBERROLE ;;
  }

  dimension: upaccountid {
    type: string
    sql: ${TABLE}.UPACCOUNTID ;;
  }

  dimension: upaccountname {
    type: string
    sql: ${TABLE}.UPACCOUNTNAME ;;
  }

  dimension: upflag {
    type: string
    sql: ${TABLE}.UPFLAG ;;
  }

  dimension: vplink {
    type: string
    sql: ${TABLE}.VPLINK ;;
  }

  dimension: vpname {
    type: string
    sql: ${TABLE}.VPNAME ;;
  }

  dimension: vpnamedashboard {
    type: string
    sql: ${TABLE}.VPNAMEDASHBOARD ;;
  }

  dimension: vpsfid {
    type: string
    sql: ${TABLE}.VPSFID ;;
  }

  dimension_group: won {
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
    sql: ${TABLE}.WONDATE ;;
  }

  dimension: ytdcomponent {
    type: string
    sql: ${TABLE}.YTDCOMPONENT ;;
  }
  dimension: salesdashboardlink {
    type: string
    sql: case
          when ${creditingregion} = 'South' then 'Sales Dahboard - South'
          else 'Sales Dahboard - Canada and UP' end;;
    link: {
      label: "Sales Details"
      url: "https://thirdi.looker.com/dashboards/42?Region={{ performance_pdt.creditingregion._filterable_value }}
      &Crediting Period={{ performance_pdt.creditingperiod._filterable_value }}
      &Crediting Year={{ performance_pdt.creditingyear._filterable_value }}"
    }
    html: <u>{{ linked_value  }}</u>;;
  }


  ##############################
  #          Measures          #
  ##############################

  ########### Actuals ###########

  measure: actual_new_usd {
    label: "Actual New $ (USD)"
    type: sum
    sql: ${TABLE}.ACTUALNEWUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  measure: actual_new_wo_cep_usd {
    label: "Actual New w/o CEP $ (USD)"
    type: sum
    sql: ${TABLE}.ACTUALNEWWOCEPUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  measure: actual_renewal_usd {
    label: "Actual Renewal $ (USD)"
    type: sum
    sql: ${TABLE}.ACTUALRENEWALUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  measure: actual_renewal_wo_ps_cep_usd {
    label: "Actual w/o CEP and PS Renewal $ (USD)"
    type: sum
    sql: ${TABLE}.ACTUALRENEWALWOPSCEPUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  measure: actual_total_usd {
    label: "Actual Total $ (USD)"
    type: sum
    sql: ${TABLE}.ACTUALTOTALUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  measure: actual_total_wo_cep_and_psrenewal_usd {
    label: "Actual Total w/o CEP and PS Renewal $ (USD)"
    type: sum
    sql: ${TABLE}.ACTUALTOTALWOCEPPSRENEWALUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  ########### Credited ###########

  measure: credited_new_usd {
    label: "Credited New $ (USD)"
    type: sum
    sql: ${TABLE}.CREDITEDNEWUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  measure: credited_renewal_usd {
    label: "Credited Renewal $ (USD)"
    type: sum
    sql: ${TABLE}.CREDITEDRENEWALUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  measure: credited_total_usd {
    label: "Credited Total $ (USD)"
    type: sum
    sql: ${TABLE}.CREDITEDTOTALUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  ########### Targets ###########

  measure: director_target_usd {
    type: max
    sql: ${TABLE}.DIRECTORTARGETUSD ;;
    value_format_name: decimal_0
  }

  measure: executive_target_usd {
    type: max
    sql: ${TABLE}.EXECUTIVETARGETUSD ;;
    value_format_name: decimal_0
  }

  measure: overall_target_usd {
    type: max
    sql: ${TABLE}.OVERALLTARGETUSD ;;
    value_format_name: decimal_0
  }

  measure: rep_director_target_usd {
    type: max
    sql: ${TABLE}.REPDIRECTORTARGETUSD ;;
    value_format_name: decimal_0
  }

  measure: stem_connect_target_usd {
    type: max
    sql: ${TABLE}.STEMCONNECTTARGETUSD ;;
    value_format_name: decimal_0
  }

  measure: stem_pd_target_usd {
    type: max
    sql: ${TABLE}.STEMPDTARGETUSD ;;
    value_format_name: decimal_0
  }

  measure: target_usd {
    type: max
    sql: ${TABLE}.TARGETUSD ;;
    value_format_name: decimal_0
  }

  measure: vp_target_usd {
    type: max
    sql: ${TABLE}.VPTARGETUSD ;;
    value_format_name: decimal_0
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: new_accounts {
    type: count_distinct
    sql:  NVL(${billtoaccountid},${selltoaccountid});;
    drill_fields: [accounts*]
  }

  set: accounts {
    fields: [billtoaccountid, billtoaccountname, billingcountry, billingstate, accountregion]
  }
  set: amount_details {
    fields: [creditingregion, businesswon_date, proposalid, productname, productclass, componentcategory,salesmanager, billtoaccountname,billingstate, credited_new_usd, credited_renewal_usd, credited_total_usd, actual_new_wo_cep_usd, actual_renewal_wo_ps_cep_usd, actual_total_wo_cep_and_psrenewal_usd, actual_new_usd, actual_renewal_usd, actual_total_usd]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      productname,
      regiondirectorname,
      vpname,
      proposalname,
      repdirectorname,
      upaccountname,
      selltoaccountname,
      billtoaccountname
    ]
  }

  ############### Boxplot Measures ############

  measure: min_credited_total {
    type: min
    sql: ${TABLE}.CREDITEDTOTALUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  measure: min_percentile_credited_total {
    type: percentile
    percentile: 25
    sql: ${TABLE}.CREDITEDTOTALUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  measure: median_credited_total {
    type: median
    sql: ${TABLE}.CREDITEDTOTALUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  measure: max_percentile_credited_total {
    type: percentile
    percentile: 76
    sql: ${TABLE}.CREDITEDTOTALUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }

  measure: max_credited_total {
    type: max
    sql: ${TABLE}.CREDITEDTOTALUSD ;;
    value_format_name: decimal_0
    drill_fields: [amount_details*]
  }


  #################### Forecast 2019 ######################

  dimension: first_day {
    type: date
    sql: TRUNC((to_date('2019-12-02 00:00','YYYY-MM-DD hh24:mi')), 'Y') ;;
    convert_tz: no
  }

  dimension: last_day {
    type: date
    sql: last_day(add_months(TRUNC((to_date('2019-12-02 00:00','YYYY-MM-DD hh24:mi')), 'Y'),11)) ;;
    convert_tz: no
  }

  dimension: hours_since_start {
    type: number
    sql: 24*((to_date('2019-12-02 00:00','YYYY-MM-DD hh24:mi')) -
    to_date(${first_day}, 'YYYY-MM-DD hh24:mi'));;
  }

  dimension: hours_until_last_day {
    type: number
    sql: 24*( to_date(${last_day}, 'YYYY-MM-DD hh24:mi') - to_date(to_char((to_date('2019-12-02 00:00','YYYY-MM-DD hh24:mi')), 'YYYY-MM-DD hh24:mi'), 'YYYY-MM-DD hh24:mi'))+24;;
  }

  dimension: hours_in_period {
    type: number
    sql: ${hours_since_start}+${hours_until_last_day} ;;
  }

  dimension: percentage_of_period_completed {
    type: number
    sql: 1.0*${hours_since_start}/NULLIF(${hours_in_period},0) ;;
    value_format_name: percent_2
  }

  measure: this_period_measure {
    type: sum
    sql:CASE WHEN ${businesswon_date} >= ${first_day} THEN ${TABLE}.ACTUALTOTALUSD END;;
    value_format_name: decimal_0
  }

  measure: projected_measure {
    type: number
    sql: 1.0*${this_period_measure}/NULLIF(${percentage_of_period_completed},0);;
    value_format_name: decimal_0
  }

#################### Forecast 2020 ######################

  dimension: first_day_2020 {
    type: date
    sql: TRUNC((to_date('2019-12-02 00:00','YYYY-MM-DD hh24:mi')), 'Y') ;;
    convert_tz: no
  }

  dimension: last_day_2020 {
    type: date
    sql: last_day(add_months(TRUNC((to_date('2019-12-02 00:00','YYYY-MM-DD hh24:mi')), 'Y'),14)) ;;
    convert_tz: no
  }

  dimension: hours_since_start_2020 {
    type: number
    sql: 24*((to_date('2019-12-02 00:00','YYYY-MM-DD hh24:mi')) -
      to_date(${first_day_2020}, 'YYYY-MM-DD hh24:mi'));;
  }

  dimension: hours_until_last_day_2020 {
    type: number
    sql: 24*( to_date(${last_day_2020}, 'YYYY-MM-DD hh24:mi') - to_date(to_char((to_date('2019-12-02 00:00','YYYY-MM-DD hh24:mi')), 'YYYY-MM-DD hh24:mi'), 'YYYY-MM-DD hh24:mi'))+24;;
  }

  dimension: hours_in_period_2020 {
    type: number
    sql: ${hours_since_start_2020}+${hours_until_last_day_2020} ;;
  }

  dimension: percentage_of_period_completed_2020 {
    type: number
    sql: 1.0*${hours_since_start_2020}/NULLIF(${hours_in_period_2020},0) ;;
    value_format_name: percent_2
  }

  measure: this_period_measure_2020 {
    type: sum
    sql:CASE WHEN ${businesswon_date} >= ${first_day_2020} THEN ${TABLE}.ACTUALTOTALUSD END;;
    value_format_name: decimal_0
  }

  measure: projected_measure_2020 {
    type: number
    sql: 1.0*${this_period_measure_2020}/NULLIF(${percentage_of_period_completed_2020},0);;
    value_format_name: decimal_0
  }

 }
