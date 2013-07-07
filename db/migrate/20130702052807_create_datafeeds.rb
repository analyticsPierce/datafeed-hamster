class CreateDatafeeds < ActiveRecord::Migration
  def change
    create_table :datafeeds do |t|
      t.text :accept_language
      t.text :browser
      t.text :browser_height
      t.text :browser_width
      t.text :campaign
      t.text :c_colorcolor
      t.text :channel
      t.text :click_action
      t.text :click_action_type
      t.text :click_context_type
      t.text :click_context_type
      t.text :click_sourceid
      t.text :click_tag
      t.text :color
      t.text :connection_type
      t.text :cookies
      t.text :country
      t.text :ct_connect_type
      t.text :currency
      t.text :curr_factor
      t.text :curr_rate
      t.datetime :cust_hit_time_gmt
      t.text :cust_visid
      t.text :daily_visitor      
      t.datetime :date_time
      t.text :domain
      t.text :duplicated_from
      t.text :duplicate_events
      t.text :duplicate_purchase
      t.text :evar1
      t.text :evar2
      t.text :evar3
      t.text :evar4
      t.text :evar5
      t.text :evar6
      t.text :evar7
      t.text :evar8
      t.text :evar9
      t.text :evar10
      t.text :evar11
      t.text :evar12
      t.text :evar13
      t.text :evar14
      t.text :evar15
      t.text :evar16
      t.text :evar17
      t.text :evar18
      t.text :evar19
      t.text :evar20
      t.text :evar21
      t.text :evar22
      t.text :evar23
      t.text :evar24
      t.text :evar25
      t.text :evar26
      t.text :evar27
      t.text :evar28
      t.text :evar29
      t.text :evar30
      t.text :evar31
      t.text :evar32
      t.text :evar33
      t.text :evar34
      t.text :evar35
      t.text :evar36
      t.text :evar37
      t.text :evar38
      t.text :evar39
      t.text :evar40
      t.text :evar41
      t.text :evar42
      t.text :evar43
      t.text :evar44
      t.text :evar45
      t.text :evar46
      t.text :evar47
      t.text :evar48
      t.text :evar49
      t.text :evar50
      t.text :evar51
      t.text :evar52
      t.text :evar53
      t.text :evar54
      t.text :evar55
      t.text :evar56
      t.text :evar57
      t.text :evar58
      t.text :evar59
      t.text :evar60
      t.text :evar61
      t.text :evar62
      t.text :evar63
      t.text :evar64
      t.text :evar65
      t.text :evar66
      t.text :evar67
      t.text :evar68
      t.text :evar69
      t.text :evar70
      t.text :evar71
      t.text :evar72
      t.text :evar73
      t.text :evar74
      t.text :evar75
      t.text :event_list
      t.text :exclude_hit
      t.text :first_hit_pagename
      t.text :first_hit_page_url
      t.text :first_hit_referrer
      t.datetime :first_hit_time_gmt
      t.text :geo_city
      t.text :geo_country
      t.text :geo_dma
      t.text :geo_region
      t.text :geo_zip
      t.text :hier1
      t.text :hier2
      t.text :hier3
      t.text :hier4
      t.text :hier5
      t.text :hitid_highigh
      t.text :hitid_low
      t.text :hit_source
      t.datetime :hit_time_gmt
      t.text :homepage
      t.text :hourly_visitor
      t.text :ip
      t.text :ip2
      t.text :java_enabled
      t.text :javascript
      t.text :j_jscript
      t.text :language
      t.datetime :last_hit_time_gmt
      t.text :last_purchase_num
      t.datetime :last_purchase_time_gmt
      t.text :mobile_id
      t.text :monthly_visitor
      t.text :mvvar1
      t.text :mvvar2
      t.text :mvvar3
      t.text :namespace
      t.text :new_visit
      t.text :os
      t.text :page_event
      t.text :page_event_var1
      t.text :page_event_var2
      t.text :page_event_event_var3
      t.text :pagename
      t.text :page_type
      t.text :paid_search
      t.text :partner_pluginsplugins
      t.text :persistent_cookie
      t.text :plugins
      t.text :post_browser_height
      t.text :post_browser_width
      t.text :post_campaign
      t.text :post_channel
      t.text :post_cookies
      t.text :post_currency
      t.datetime :post_cust_hit_time_gmt
      t.text :post_cust_visid
      t.text :post_evar1
      t.text :post_evar2
      t.text :post_evar3
      t.text :post_evar4
      t.text :post_evar5
      t.text :post_evar6
      t.text :post_evar7
      t.text :post_evar8
      t.text :post_evar9
      t.text :post_evar10
      t.text :post_evar11
      t.text :post_evar12
      t.text :post_evar13
      t.text :post_evar14
      t.text :post_evar15
      t.text :post_evar16
      t.text :post_evar17
      t.text :post_evar18
      t.text :post_evar19
      t.text :post_evar20
      t.text :post_evar21
      t.text :post_evar22
      t.text :post_evar23
      t.text :post_evar24
      t.text :post_evar25
      t.text :post_evar26
      t.text :post_evar27
      t.text :post_evar28
      t.text :post_evar29
      t.text :post_evar30
      t.text :post_evar31
      t.text :post_evar32
      t.text :post_evar33
      t.text :post_evar34
      t.text :post_evar35
      t.text :post_evar36
      t.text :post_evar37
      t.text :post_evar38
      t.text :post_evar39
      t.text :post_evar40
      t.text :post_evar41
      t.text :post_evar42
      t.text :post_evar43
      t.text :post_evar44
      t.text :post_evar45
      t.text :post_evar46
      t.text :post_evar47
      t.text :post_evar48
      t.text :post_evar49
      t.text :post_evar50
      t.text :post_evar51
      t.text :post_evar52
      t.text :post_evar53
      t.text :post_evar54
      t.text :post_evar55
      t.text :post_evar56
      t.text :post_evar57
      t.text :post_evar58
      t.text :post_evar59
      t.text :post_evar60
      t.text :post_evar61
      t.text :post_evar62
      t.text :post_evar63
      t.text :post_evar64
      t.text :post_evar65
      t.text :post_evar66
      t.text :post_evar67
      t.text :post_evar68
      t.text :post_evar69
      t.text :post_evar70
      t.text :post_evar71
      t.text :post_evar72
      t.text :post_evar73
      t.text :post_evar74
      t.text :post_evar75
      t.text :post_event_list
      t.text :post_hier1
      t.text :post_hier2
      t.text :post_hier3
      t.text :post_hier4
      t.text :post_hier5
      t.text :post_java_enabled
      t.text :post_keywords
      t.text :post_mvvar1
      t.text :post_mvvar2
      t.text :post_mvvar3
      t.text :post_page_event
      t.text :post_page_event_var1
      t.text :post_page_event_var2
      t.text :post_page_event_var3
      t.text :post_pagename
      t.text :post_pagename_no_url
      t.text :post_page_type
      t.text :post_page_url
      t.text :post_partner_plugins
      t.text :post_persistent_cookie
      t.text :post_product_list
      t.text :post_prop1
      t.text :post_prop2
      t.text :post_prop3
      t.text :post_prop4
      t.text :post_prop5
      t.text :post_prop6
      t.text :post_prop7
      t.text :post_prop8
      t.text :post_prop9
      t.text :post_prop10
      t.text :post_prop11
      t.text :post_prop12
      t.text :post_prop13
      t.text :post_prop14
      t.text :post_prop15
      t.text :post_prop16
      t.text :post_prop17
      t.text :post_prop18
      t.text :post_prop19
      t.text :post_prop20
      t.text :post_prop21
      t.text :post_prop22
      t.text :post_prop23
      t.text :post_prop24
      t.text :post_prop25
      t.text :post_prop26
      t.text :post_prop27
      t.text :post_prop28
      t.text :post_prop29
      t.text :post_prop30
      t.text :post_prop31
      t.text :post_prop32
      t.text :post_prop33
      t.text :post_prop34
      t.text :post_prop35
      t.text :post_prop36
      t.text :post_prop37
      t.text :post_prop38
      t.text :post_prop39
      t.text :post_prop40
      t.text :post_prop41
      t.text :post_prop42
      t.text :post_prop43
      t.text :post_prop44
      t.text :post_prop45
      t.text :post_prop46
      t.text :post_prop47
      t.text :post_prop48
      t.text :post_prop49
      t.text :post_prop50
      t.text :post_prop51
      t.text :post_prop52
      t.text :post_prop53
      t.text :post_prop54
      t.text :post_prop55
      t.text :post_prop56
      t.text :post_prop57
      t.text :post_prop58
      t.text :post_prop59
      t.text :post_prop60
      t.text :post_prop61
      t.text :post_prop62
      t.text :post_prop63
      t.text :post_prop64
      t.text :post_prop65
      t.text :post_prop66
      t.text :post_prop67
      t.text :post_prop68
      t.text :post_prop69
      t.text :post_prop70
      t.text :post_prop71
      t.text :post_prop72
      t.text :post_prop73
      t.text :post_prop74
      t.text :post_prop75
      t.text :post_purchaseid
      t.text :post_referrer
      t.text :post_search_engine
      t.text :post_state
      t.text :post_survey
      t.text :post_tnt
      t.text :post_transactionid
      t.datetime :post_t_time_info
      t.text :post_visid_high
      t.text :post_visid_low
      t.text :post_visid_type
      t.text :post_zip
      t.text :p_plugins
      t.text :prev_page
      t.text :product_list
      t.text :product_merchandising
      t.text :prop1
      t.text :prop2
      t.text :prop3
      t.text :prop4
      t.text :prop5
      t.text :prop6
      t.text :prop7
      t.text :prop8
      t.text :prop9
      t.text :prop10
      t.text :prop11
      t.text :prop12
      t.text :prop13
      t.text :prop14
      t.text :prop15
      t.text :prop16
      t.text :prop17
      t.text :prop18
      t.text :prop19
      t.text :prop20
      t.text :prop21
      t.text :prop22
      t.text :prop23
      t.text :prop24
      t.text :prop25 
      t.text :prop26
      t.text :prop27
      t.text :prop28
      t.text :prop29
      t.text :prop30
      t.text :prop31
      t.text :prop32
      t.text :prop33
      t.text :prop34
      t.text :prop35
      t.text :prop36
      t.text :prop37
      t.text :prop38
      t.text :prop39
      t.text :prop40
      t.text :prop41
      t.text :prop42
      t.text :prop43
      t.text :prop44
      t.text :prop45
      t.text :prop46
      t.text :prop47
      t.text :prop48
      t.text :prop49
      t.text :prop50
      t.text :prop51
      t.text :prop52
      t.text :prop53
      t.text :prop54
      t.text :prop55
      t.text :prop56
      t.text :prop57
      t.text :prop58
      t.text :prop59
      t.text :prop60
      t.text :prop61
      t.text :prop62
      t.text :prop63
      t.text :prop64
      t.text :prop65
      t.text :prop66
      t.text :prop67
      t.text :prop68
      t.text :prop69
      t.text :prop70
      t.text :prop71
      t.text :prop72
      t.text :prop73
      t.text :prop74
      t.text :prop75
      t.text :purchaseid
      t.text :quarterly_visitor
      t.text :ref_domain
      t.text :referrer
      t.text :ref_type
      t.text :resolution
      t.text :sampled_hit
      t.text :search_engine
      t.text :search_page_num
      t.text :secondary_hit
      t.text :service
      t.text :sourceid
      t.text :s_resolution
      t.text :state
      t.text :stats_server
      t.text :tnt
      t.text :tnt_post_vista
      t.text :transactionid
      t.text :truncated_hit
      t.text :t_time_info
      t.text :ua_color
      t.text :ua_os
      t.text :ua_pixels
      t.text :user_agent
      t.text :user_hash
      t.text :userid
      t.text :username
      t.text :user_server
      t.text :va_closer_ser_detail
      t.text :va_closer_id
      t.text :va_finder_detail
      t.text :va_finder_id
      t.text :va_instance_event
      t.text :va_new_engagement
      t.text :visid_high
      t.text :visid_low
      t.text :visid_new
      t.datetime :visid_timestamp
      t.text :visid_type
      t.text :visit_keywords
      t.text :visit_num
      t.text :visit_page_num
      t.text :visit_referrer
      t.text :visit_search_engine
      t.text :visit_start_pagename
      t.text :visit_start_page_url
      t.datetime :visit_start_time_gmt
      t.text :weekly_visitor
      t.text :yearly_visitor
      t.text :zip

      t.timestamps
    end
  end
end
