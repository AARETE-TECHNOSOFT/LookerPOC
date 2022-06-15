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
    label: "Tin"
    primary_key: yes
    type: number
    sql: ${TABLE}.PROV_IRS_NUM_TIN ;;
    value_format: "0"
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
    <p style="font-size:23px;">{{rendered_value}} </p>
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
    <p style="font-size:23px;">{{rendered_value}}</p>
    ;;
  }
  #<img src="https://img.icons8.com/ios/50/000000/hospital-3.png"width="30" height="30" />

  dimension: dummy__savings {
    type: number
    sql: ${TABLE}.DUMMY__SAVINGS ;;
  }

  dimension: Provider {
    type: string
    #sql: ${TABLE}.GROUPNAME ;;
     sql:{% if _user_attributes['shubhangi_test_user']  == 'yes' %}
      ${TABLE}.GROUPNAME
    {% else %}
      '[REDACTED]'
    {% endif %}   ;;
    # html:
    # <p style="font-size:23px;">{{rendered_value}}</p>
    # ;;
   # required_access_grants: [shubhangi_test_user]

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
     <p style="font-size:23px;">{{rendered_value}}</p>
    ;;
    # html:

    #   <p><img src="https://img.icons8.com/ios/50/000000/conference-call--v1.png" width="30" height="30" />&emsp;{{rendered_value}} </p>
    # ;;
  }
  dimension: Members1 {
    type: number
    sql: ${TABLE}.MEMBER_COUNT ;;
    #value_format:"0,\" K\""
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
    html:
    <p style="font-size:23px;">{{rendered_value}}</p>
    ;;

  }

  dimension: total_spend {
    type: number
    sql: ${TABLE}.TOTAL_SPEND ;;
    html:
    <a href="https://thirdi.looker.com/embed/dashboards/108?Dummy+Initiative+Tag= {{ _filters['data_fidelis_.dummy_initiative_tag'] | url_encode }} &Year+=& Provider={{ _filters['provider_overview_fd.Provider'] | url_encode }}" target="_blank"> {{rendered_value}}</a>
    ;;

  }
  dimension: HTMLCODE1 {
    sql: 1 ;;
    html:
    <html>
    <body>
    <P style="color:black;background-color:#0096A5;font-size: 5pt; margin:5px auto;text-align:left;padding-left: 30px;padding-top: 18px;padding-bottom: 18px;margin:0;">
    <img src="https://www.fideliscare.org/Portals/_default/Skins/Orion/img/logoHorizontal.png" width="200" height="48"/></p>
    <P style="color:black;background-color:#23AAB8;font-size: 5pt; margin:5px auto;text-align:left;padding-left: 30px;padding-top: 20px;padding-bottom: 20px;margin : 0">
   <a href="https://thirdi.looker.com/embed/dashboards/108?Provider={{ _filters['provider_overview_fd.Provider'] | url_encode }}&Initiative+Tag={{ _filters['data_fidelis_.dummy_initiative_tag'] | url_encode }}&year=2019" target="_blank"><img src="https://www.linkpicture.com/q/Initiative-CTA_1.png" width="196" height="40"/></a>&emsp;&emsp;
    <a href="https://thirdi.looker.com/embed/dashboards/111?Geography=&Sys+Date+Date=2022%2F01%2F12" target="_blank"><img src="https://www.linkpicture.com/q/Scorecard-CTA_1.png" width="196" height="40"/></a></p>
    </body>
    </html>
    ;;
  }

  dimension: HTMLCODE2 {
    sql: 1 ;;
    html:
    <html>
    <body>
    <P style="color:black;background-color:#0096A5;font-size: 5pt; margin:5px auto;text-align:left;padding-left: 30px;padding-top: 18px;padding-bottom: 18px;margin:0;">
    <img src="https://www.fideliscare.org/Portals/_default/Skins/Orion/img/logoHorizontal.png" width="200" height="48"/></p>
    <P style="color:black;background-color:#23AAB8;font-size: 5pt; margin:5px auto;text-align:left;padding-left: 30px;padding-top: 20px;padding-bottom: 20px;margin : 0">
     <a href="https://thirdi.looker.com/embed/dashboards/104?Year=&Initiative+Tag={{ _filters['data_fidelis_.dummy_initiative_tag'] | url_encode }}&Provider+={{ _filters['provider_overview_fd.Provider'] | url_encode }}" target="_blank"><img src="https://www.linkpicture.com/q/Provider-CTA.png" width="196" height="40"/></a>&emsp;&emsp;
    <a href="https://thirdi.looker.com/embed/dashboards/111?Geography=&Sys+Date+Date=2022%2F01%2F12" target="_blank"><img src="https://www.linkpicture.com/q/Scorecard-CTA_1.png" width="196" height="40"/></a></p>
    </body>
    </html>
    ;;
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
  measure: target1 {
    type: number
    sql: 5000;;
    # value_format: "0.00,\" K\""
  }

  measure: creating_Table {
    sql: 1 ;;
    html:
      <html>
          <body>

             <table style="width:100%;height:50%;border:1;align:center;font-size:15px">
                    <tr>
                     <th style="border: 1px solid black; background-color:#ADD8E6 ; font:2px"><b> Sr. no</b></th>
                        <th style="border: 1px solid black; background-color:#ADD8E6 ; font:2px">
                        <a><img src="http://findicons.com/files/icons/573/must_have/48/check.png" height=20 width=20></a>
                        <b> total_annual_spend</b></th>
                        <th style="border: 1px solid black; background-color:#ADD8E6 ; font:2px">
                        <a><img src="http://findicons.com/files/icons/1681/siena/128/clock_blue.png" height=20 width=20></a>
                        <b> distinct_npi_billed</b> </th>
                        <th style="border: 1px solid black; background-color:#ADD8E6 ; font:2px">
                        <a><img src="https://img.icons8.com/ios/50/000000/conference-call--v1.png" height=20 width=20></a>
                        <b> Members </b></th>

                      </tr>
                      <tr style="border: 1px solid black;text-align:center">
                        <td style="text-align:center">1</td>
                        <td style="float:center; border: 1px solid black; font:2px;text-align:center">{{provider_overview_fd.total_annual_spend._value}}</td>
                        <td style="float:center; border: 1px solid black; font:2px;text-align:center">{{provider_overview_fd.distinct_npi_billed}}</td>
                        <td style="float:center; border: 1px solid black; font:2px;text-align:center">{{provider_overview_fd.Members}}</td>

                      </tr>
                      <tr>

                      <td style="text-align:center;border: 1px solid black;">2</td>
                        <td style="text-align:center;border: 1px solid black;">
                        <p><a href="https://docs.looker.com/exploring-data/visualizing-query-results"><img src="https://logo-core.clearbit.com/looker.com" height=40 width=40 /></a></p>
                        </td>
                        <td style="text-align:center;border: 1px solid black;background-color:#ADD8E6;">
                        </td>
                        <td style="text-align:center;border: 1px solid black;color:red"> 123456
                        </td>

                      </tr>
                </TABLE>

          </body>
    </html>
      ;;
  }
  measure:CreatingNavigationBar{
    sql: 1 ;;
    html:
    <html>

      <body>
         <table style="width:100%;height:50%;align:center;font-size:15px;padding-left: 30px;padding-top: 20px;padding-bottom: 5px;" >
           <tr>
                <td style="text-align:center;width:200px;">
                <p ><a style="border-bottom: 2px solid yellow;color:black;cursor: pointer;"class="current" href="https://thirdi.looker.com/dashboards/117"target="_blank" style="color:black">
                <img src="https://img.icons8.com/ios-filled/50/000000/sim-card.png" style="width:23px;height:23px;align:left;float:center;margin-right:2px;margin-bottom:15px;"/> ALL NETWORKS</a>
                </p>
               </td>
                <td style="text-align:center; width:200px;">
                    <p><a href="https://thirdi.looker.com/dashboards/96?Created+Date=30+day" target="_blank" style="color:black">
                    <img src="https://img.icons8.com/ios-filled/50/000000/truck.png" style="width:30px;height:30px;align:left;float:center;margin-right:5px;margin-bottom:15px;" />TRANSPORTATION</a></p>
                </td>
               <td  style="text-align:center; width:200px;">
                    <p><a href="https://thirdi.looker.com/dashboards/104?Year+=&Initiative+Tag=HBR+Initiative&Provider+=Empire+City+Laboratories+Inc" target="_blank" style="color:black">
                    <img src="https://img.icons8.com/external-vitaliy-gorbachev-fill-vitaly-gorbachev/60/000000/external-shopping-cart-cyber-monday-vitaliy-gorbachev-fill-vitaly-gorbachev.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;margin-bottom:15px;" />GDC</a></p>
                </td>

                <td  style="text-align:center; width:200px;">
                    <p><a href="https://thirdi.looker.com/dashboards/111?Provider=&+Date+=2022%2F02%2F17" target="_blank" style="color:black">
                    <img src="https://img.icons8.com/glyph-neue/64/000000/mobile-order.png" style="width:25px;height:25px;align:left;float:center;margin-right:3px;margin-bottom:15px;" />FC</a></p>
                </td>

                <td  style="text-align:center; width:200px;">
                    <p><a href="https://thirdi.looker.com/dashboards/104?Year+=&Initiative+Tag=HBR+Initiative&Provider+=Empire+City+Laboratories+Inc" target="_blank" style="color:black">
                    <img src="https://img.icons8.com/external-kiranshastry-solid-kiranshastry/64/000000/external-home-miscellaneous-kiranshastry-solid-kiranshastry.png" style="width:27px;height:27px;align:left;float:center;margin-right:3px;margin-bottom:15px;" />RDC</a></p>
                </td>
           </tr>
       </table>

      </body>
    </html>
    ;;
  }
  measure: test1 {
    sql: 1 ;;
    html:
    <html>

         <p style="background-color:#808080;color:white;font-size:21px;text-align: center;border-radius: 12px;"><img src="https://img.icons8.com/ios/50/ffffff/circled-i.png"   align="left" style="width:25px;height:20px;padding-left:5px;padding-left:5px;align:left;margin-top:21px;"title="Provider Info"/><b>Provider Information</b>
        <a href="https://thirdi.looker.com/dashboards/96?Created%20Date=30%20day" target="_blank">&nbsp;
       <img src="https://img.icons8.com/ios/50/ffffff/external-link-squared.png" style="width:25px;height:20px;display: inline-block;font-weight:bold;margin-bottom:8.5px;"/></a></p>
        <p style="display: inline;font-size:20px;">
            <strong style="display: inline;font-size:25px;">{{ provider_overview_fd.distinct_npi_billed._value }}  </strong>
            <font color="#000000"> Distinct npi billed count   &nbsp; | </font> </p>&nbsp;
        <p style="display: inline;font-size:20px;">
                {% if provider_overview_fd.Provider._value == 'Empire City Laboratories Inc' %}
             <p style="color: #009900;font-size:20px;display: inline;">▲ {{provider_overview_fd.total_annual_spend._value  }}
             <font color="#000000">Annual Spend on Empire city </font></p>
             {% else %}
             <p style="color: #990000;font-size:20px;display: inline;">▼ {{ provider_overview_fd.dummy__savings._value }}
            <font color="#000000">Dummy savings  </font></p>
             {% endif %}
        </p>



    </html>
    ;;
  }




}
