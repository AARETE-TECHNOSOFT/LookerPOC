view: provider_derivetable {
  derived_table: {
    sql: select prov_irs_num_tin,groupname Provider,tin,member_count Members, Distinct_npi_billed NPIs,
          Annual_spend ,
          dummy__savings annual_savings
          from provider_overview_fd where tin='TIN 203734391' ;;
  }
  dimension: prov_irs_num_tin {
    type: number
    primary_key: yes
    sql: ${TABLE}.prov_irs_num_tin ;;
  }
  dimension:  Provider{
    type: string
    sql: ${TABLE}.Provider ;;
    html:
    <p style="font-size:30px">{{rendered_value}}</p>
    ;;
  }
  dimension: tin {
    type: string
    sql: ${TABLE}.tin ;;
    html:
    <p style="font-size:10px">{{rendered_value}}</p>
    ;;
  }
  dimension:  Members{
    type: number
    sql: ${TABLE}.Members ;;
    value_format: "0,\" K\""
    html:
    <p><img src="C:\Users\mutture\Downloads\personal.png">{{rendered_value}} </p>

    ;;
     #<ul>
#     {% if  value == 'Complete' %}
#         <p style="color: black; background-color: lightblue">
#       <img src="http://findicons.com/files/icons/573/must_have/48/check.png" height=20 width=20>{{rendered_value}}</p>

  #   html:
  # <img src="https://www.vectorstock.com/royalty-free-vector/image-a-person-icon-people-icon-on-blue-vector-27565297">
  #   ;;
    }
    dimension: NPIs {
      type: number
      sql: ${TABLE}.NPIs ;;
    }
    dimension:  Annual_spend{
      type: number
      sql: ${TABLE}.Annual_spend ;;
      value_format: "$0.000,,\" M\""
    }
    dimension: annual_savings {
      type: number
      sql: ${TABLE}.annual_savings ;;
      value_format: "$0.000,,\" M\""
    }
    measure: count {
      type: count
    }
  }
