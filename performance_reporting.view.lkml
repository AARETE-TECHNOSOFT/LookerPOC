view: performance_reporting {
  sql_table_name: C##LOOKER.PERFORMANCE_REPORTING ;;

  dimension: accountregion {
    type: string
    sql: ${TABLE}.ACCOUNTREGION ;;
  }

  dimension: actualnewusd {
    type: number
    sql: ${TABLE}.ACTUALNEWUSD ;;
  }

  dimension: actualnewwocepusd {
    type: number
    sql: ${TABLE}.ACTUALNEWWOCEPUSD ;;
  }

  dimension: actualrenewalusd {
    type: number
    sql: ${TABLE}.ACTUALRENEWALUSD ;;
  }

  dimension: actualrenewalwopscepusd {
    type: number
    sql: ${TABLE}.ACTUALRENEWALWOPSCEPUSD ;;
  }

  dimension: actualtotalusd {
    type: number
    sql: ${TABLE}.ACTUALTOTALUSD ;;
  }

  dimension: actualtotalwoceppsrenewalusd {
    type: number
    sql: ${TABLE}.ACTUALTOTALWOCEPPSRENEWALUSD ;;
  }

  dimension: asofquarter {
    type: number
    sql: ${TABLE}.ASOFQUARTER ;;
  }

  dimension: asofyear {
    type: number
    sql: ${TABLE}.ASOFYEAR ;;
  }

  dimension: billingcountry {
    type: string
    sql: ${TABLE}.BILLINGCOUNTRY ;;
  }

  dimension: billingstate {
    type: string
    sql: ${TABLE}.BILLINGSTATE ;;
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

  dimension_group: businesswondate {
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

  dimension: creditednewusd {
    type: number
    sql: ${TABLE}.CREDITEDNEWUSD ;;
  }

  dimension: creditedrenewalusd {
    type: number
    sql: ${TABLE}.CREDITEDRENEWALUSD ;;
  }

  dimension: creditedtotalusd {
    type: number
    sql: ${TABLE}.CREDITEDTOTALUSD ;;
  }

  dimension: creditingperiod {
    type: string
    sql: ${TABLE}.CREDITINGPERIOD ;;
  }

  dimension_group: creditingperiodenddate {
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

  dimension_group: creditingperiodstartdate {
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

  dimension: directortargetusd {
    type: number
    sql: ${TABLE}.DIRECTORTARGETUSD ;;
  }

  dimension_group: effyearenddate {
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

  dimension_group: effyearstartdate {
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

  dimension: executivetargetusd {
    type: number
    sql: ${TABLE}.EXECUTIVETARGETUSD ;;
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

  dimension_group: masterproposalwondate {
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

  dimension: overalltargetusd {
    type: number
    sql: ${TABLE}.OVERALLTARGETUSD ;;
  }

  dimension: pdbillingoptions {
    type: string
    sql: ${TABLE}.PDBILLINGOPTIONS ;;
  }

  dimension: primarykey {
    type: string
    sql: ${TABLE}.PRIMARYKEY ;;
  }

  dimension: productcategory {
    type: string
    sql: ${TABLE}.PRODUCTCATEGORY ;;
  }

  dimension: productclass {
    type: string
    sql: ${TABLE}.PRODUCTCLASS ;;
  }

  dimension_group: productenddate {
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

  dimension_group: productstartdate {
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

  dimension_group: proposalexpectedenddate {
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

  dimension_group: proposalexpectedstartdate {
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

  dimension_group: quarterenddate {
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

  dimension: repdirectortargetusd {
    type: number
    sql: ${TABLE}.REPDIRECTORTARGETUSD ;;
  }

  dimension: repemail {
    type: string
    sql: ${TABLE}.REPEMAIL ;;
  }

  dimension: salesmanager {
    type: string
    sql: ${TABLE}.SALESMANAGER ;;
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
  }

  dimension: selltostate {
    type: string
    sql: ${TABLE}.SELLTOSTATE ;;
  }

  dimension: soldtoupflag {
    type: string
    sql: ${TABLE}.SOLDTOUPFLAG ;;
  }

  dimension: stemconnecttargetusd {
    type: number
    sql: ${TABLE}.STEMCONNECTTARGETUSD ;;
  }

  dimension: stempdtargetusd {
    type: number
    sql: ${TABLE}.STEMPDTARGETUSD ;;
  }

  dimension: streamingdigital {
    type: string
    sql: ${TABLE}.STREAMINGDIGITAL ;;
  }

  dimension: targetusd {
    type: number
    sql: ${TABLE}.TARGETUSD ;;
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

  dimension: vptargetusd {
    type: number
    sql: ${TABLE}.VPTARGETUSD ;;
  }

  dimension_group: wondate {
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

  measure: count {
    type: count
    drill_fields: [detail*]
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
}
