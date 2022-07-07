# The name of this view in Looker is "Ga Marketing"
view: ga_marketing {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "C##LOOKER".GA_MARKETING
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ad Clicks" in Explore.

  dimension: ad_clicks {
    type: number
    sql: ${TABLE}.AD_CLICKS ;;
    primary_key: yes
  }

  dimension: ad_impressions {
    type: number
    sql: ${TABLE}.AD_IMPRESSIONS ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ad_impressions {
    type: sum
    sql: ${ad_impressions} ;;
  }

  measure: average_ad_impressions {
    type: average
    sql: ${ad_impressions} ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date_ {
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
    sql: ${TABLE}.DATE_ ;;
  }

  dimension: game {
    type: string
    sql: ${TABLE}.GAME ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.PLATFORM ;;
  }

  dimension: views_to_install {
    type: number
    sql: ${TABLE}.VIEWS_TO_INSTALL ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure:VTI_TM{
    type: sum
    sql: ${TABLE}.VIEWS_TO_INSTALL ;;

  }

  measure: AD_Impressions_sum {
    type: sum
    sql:${TABLE}.AD_IMPRESSIONS ;;
  }

  measure: AD_Clicks_sum {
    type: sum
    sql:${TABLE}.AD_CLICKS ;;
}

  filter: month_filter1 {
    type: date
    #suggestions: ["01-02-2020"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]

  }

  dimension: Start_Date {
    type: string
    sql: '2020-01-01' ;;
    }

  measure: Last12month
  {
    type: average
    sql:case when ${date__date}>= ${Start_Date} and to_date(${date__date},'yyyy-mm-dd')< {% date_end month_filter1 %} then 1 else 0 end  ;;
  }

  measure: AD_Impressions_Last12Months {
    type: number
    sql: case when ${Last12month}=1 then
      sum(${TABLE}.AD_IMPRESSIONS ) else null end;;
  }

  measure: AD_Clicks_Last12Months {
    type: number
    sql: case when ${Last12month}=1 then
      sum(${TABLE}.AD_CLICKS) else null end;;
  }



  filter: month_filter {
    type: string
    #suggestions: ["01-02-2020"]
    suggestions: ["2020-01","2020-02","2020-03","2020-04","2020-05","2020-06","2020-07","2020-08","2020-09","2020-10","2020-11","2020-12"]

  }

  measure: VTI_selected_month {
    type: sum
    sql: case when {% condition month_filter %} ${date__month} {% endcondition %} then ${TABLE}.VIEWS_TO_INSTALL end ;;
  }

  measure: VTI_LM_pr {
    type: sum
    sql: CASE WHEN {% condition month_filter %}  To_char(ADD_MONTHS(to_date(${date__date},'yyyy-mm-dd'),1),'yyyy-mm')
      {% endcondition %} THEN ${TABLE}.VIEWS_TO_INSTALL end ;;
  }

  measure: VTI_Growth{
    type: number
    sql: ((${VTI_selected_month}-${VTI_LM_pr})/nullif(${VTI_LM_pr},0));;
    value_format: "0.0%"
  }

}
