require 'csv'

namespace :datafeed do
  desc "Pick up and process SiteCatalyst datafeed files. "
  task :load => :environment do

      # logging setup
      @log = Logger.new(Rails.root.join('log','sc_datafeed_log.log'), 10, 1024000)
      @log.level = Logger::INFO

      # path for data
      # @data_file = 'hit_data.tsv'
      @data_path = Rails.root.join('data')
      @archive_path = Rails.root.join('data','archive')

      # localhost database connection
      @db = Mysql2::Client.new(:host => "127.0.0.1", :username => "root")
begin 
      # copy all files into archive path
      begin
         Dir["#{@data_path}*.*"].each do |file|
             begin
               file_basename = File.basename("#{file}")    
               FileUtils.copy("#{file}","#{@archive_path}#{file_basename}")
               @log.info("Archived file #{file}")
             rescue Exception => e
               @log.warn("Unable to archive file: #{file_basename} because #{e.message}")  
             end
         end
      end
end
=begin
      # unzip any zip files
      begin
        Dir["#{@data_path}*.gz"].each do |file|  
          begin
            file_name = File.basename(file)
            file_name = file_name.gsub(".gz","")
            query = ["cd ","#{@data_path}","; gunzip ","#{file}"].join
            system query
            @log.info("Gunzipped file #{file_name}")
          rescue Exception => e
            @log.warn("Unable to unzip file: #{file} because #{e.message}")
          end
        end
      end
=end

      # array of regex patterns to remove from feed
      stops = ["[", "]", "^", "\\", "\r", "\n"]

      # remove illegal characters before file processingº
      Dir["#{ @data_path }*.tsv"].each do |tsv_file|
        begin
          # trying something different, encoding down to utf8 first
#          File.encode('UTF-8')
          begin          
            File.open(tsv_file + '.new', 'w') do |file_out|
             begin
              File.foreach(tsv_file) do |line_in|
                line_in.encode!('UTF-16', 'UTF-8', :invalid => :replace, :replace => '')
                line_in.encode!('UTF-8', 'UTF-16')
                file_out.puts line_in.gsub('"','')
              end
             rescue nil
             end   
            end
          rescue nil  
          end
          File.rename(tsv_file, tsv_file + '.old')
          File.rename(tsv_file + '.new', tsv_file)
        rescue Exception => e
          @log.warn("Unable to replace the bad characters because #{ e.message }")
        end
      end        

      begin
        Dir["#{@data_path}*.tsv"].each do |dir_file|
          begin 
            File.open(dir_file, "w+") do |file|
              file.lines.each do |line|
                # line.gsub(/\\t/, " ") 
                line.gsub(/\\/, " ")                  
                line.gsub(/"/, "")                  
                line.gsub(/'/, "")                  
                line.gsub(/\(\"/, "(") 
                line.gsub(/\"\)/, ")")
              end 
            end   
          rescue Exception => e
            @log.warn("Unable to replace the bad characters because #{e.message}")
            next
          end
        end      
      rescue
        nil
      end
                
      # process the tsv file
      begin
       Dir["#{@data_path}*.tsv"].each do |file|
           begin 
              @file = file
              # removed: , :quote_char => '"'"
              CSV.foreach(file, :col_sep => "\t")  do |row|
                begin
                 # remove offending characters
                 # row.map!{ |e| e.gsub(/\\t/, " ") unless e.blank? }
                 # row.map!{ |e| e.gsub(/\\/, " ") unless e.blank? }                   
                 @proc_row = (row.to_s)               
                 # use row here...
                 d = Datafeeds.new
                 d.accept_language = row[0]
                 d.browser = row[1]
                 d.browser_height = row[2]
                 d.browser_width = row[3]
                 d.campaign = row[4]
                 d.c_color = row[5]
                 d.channel = row[6]
                 d.click_action = row[7]
                 d.click_action_type = row[8]
                 d.click_context = row[9]
                 d.click_context_type = row[10]
                 d.click_sourceid = row[11]
                 d.click_tag = row[12]
                 d.code_ver = row[13]
                 d.color = row[14]
                 d.connection_type = row[15]
                 d.cookies = row[16]
                 d.country = row[17]
                 d.ct_connect_type = row[18]
                 d.currency = row[19]
                 d.curr_factor = row[20]
                 d.curr_rate = row[21]
                 d.cust_hit_time_gmt = row[22]
                 d.cust_visid = row[23]
                 d.daily_visitor = row[24]
                 d.date_time = row[25]
                 d.domain = row[26]
                 d.duplicated_from = row[27]
                 d.duplicate_events = row[28]
                 d.duplicate_purchase = row[29]
                 d.evar1 = row[30]
                 d.evar2 = row[31]
                 d.evar3 = row[32]
                 d.evar4 = row[33]
                 d.evar5 = row[34]
                 d.evar6 = row[35]
                 d.evar7 = row[36]
                 d.evar8 = row[37]
                 d.evar9 = row[38]
                 d.evar10 = row[39]
                 d.evar11 = row[40]
                 d.evar12 = row[41]
                 d.evar13 = row[42]
                 d.evar14 = row[43]
                 d.evar15 = row[44]
                 d.evar16 = row[45]
                 d.evar17 = row[46]
                 d.evar18 = row[47]
                 d.evar19 = row[48]
                 d.evar20 = row[49]
                 d.evar21 = row[50]
                 d.evar22 = row[51]
                 d.evar23 = row[52]
                 d.evar24 = row[53]
                 d.evar25 = row[54]
                 d.evar26 = row[55]
                 d.evar27 = row[56]
                 d.evar28 = row[57]
                 d.evar29 = row[58]
                 d.evar30 = row[59]
                 d.evar31 = row[60]
                 d.evar32 = row[61]
                 d.evar33 = row[62]
                 d.evar34 = row[63]
                 d.evar35 = row[64]
                 d.evar36 = row[65]
                 d.evar37 = row[66]
                 d.evar38 = row[67]
                 d.evar39 = row[68]
                 d.evar40 = row[69] 
                 d.evar41 = row[70]
                 d.evar42 = row[71]
                 d.evar43 = row[72]
                 d.evar44 = row[73]
                 d.evar45 = row[74]
                 d.evar46 = row[75]
                 d.evar47 = row[76]
                 d.evar48 = row[77]
                 d.evar49 = row[78]
                 d.evar50 = row[79]
                 d.evar51 = row[80]
                 d.evar52 = row[81]
                 d.evar53 = row[82]
                 d.evar54 = row[83]
                 d.evar55 = row[84]
                 d.evar56 = row[85]
                 d.evar57 = row[86]
                 d.evar58 = row[87]
                 d.evar59 = row[88]
                 d.evar60 = row[89]
                 d.evar61 = row[90]
                 d.evar62 = row[91]
                 d.evar63 = row[92]
                 d.evar64 = row[93]
                 d.evar65 = row[94]
                 d.evar66 = row[95]
                 d.evar67 = row[96]
                 d.evar68 = row[97]
                 d.evar69 = row[98]
                 d.evar70 = row[99]
                 d.evar71 = row[100]
                 d.evar72 = row[101]
                 d.evar73 = row[102]
                 d.evar74 = row[103]
                 d.evar75 = row[104]
                 d.event_list = row[105]
                 d.exclude_hit = row[106]
                 d.first_hit_pagename = row[107]
                 d.first_hit_page_url = row[108]
                 d.first_hit_referrer = row[109]
                 d.first_hit_time_gmt = row[110]  
                 d.geo_city = row[111]
                 d.geo_country = row[112]
                 d.geo_dma = row[113]
                 d.geo_region = row[114]
                 d.geo_zip = row[115]
                 d.hier1 = row[116]
                 d.hier2 = row[117]
                 d.hier3 = row[118]
                 d.hier4 = row[119]
                 d.hier5 = row[120]
                 d.hitid_high = row[121]  
                 d.hitid_low = row[122]
                 d.hit_source = row[123]
                 d.hit_time_gmt = row[124]
                 d.homepage = row[125]
                 d.hourly_visitor = row[126]
                 d.ip = row[127]
                 d.ip2 = row[128]
                 d.java_enabled = row[129]
                 d.javascript = row[130]
                 d.j_jscript = row[131]
                 d.language = row[132]
                 d.last_hit_time_gmt = row[133]
                 d.last_purchase_num = row[134]
                 d.last_purchase_time_gmt = row[135]
                 d.mobile_id = row[136]
                 d.monthly_visitor = row[137]
                 d.mvvar1 = row[138]
                 d.mvvar2 = row[139]
                 d.mvvar3 = row[140]
                 d.namespace = row[141]
                 d.new_visit = row[142]
                 d.os = row[143]
                 d.page_event = row[144]
                 d.page_event_var1 = row[145]
                 d.page_event_var2 = row[146]
                 d.page_event_var3 = row[147]
                 d.pagename = row[148]
                 d.page_type = row[149]
                 d.page_url = row[150]
                 d.paid_search = row[151]
                 d.partner_plugins = row[152]
                 d.persistent_cookie = row[153]
                 d.plugins = row[154]
                 d.post_browser_height = row[155]
                 d.post_browser_width = row[156]
                 d.post_campaign = row[157]
                 d.post_channel = row[158]
                 d.post_cookies = row[159]
                 d.post_currency = row[160]
                 d.post_cust_hit_time_gmt = row[161]
                 d.post_cust_visid = row[162]
                 d.post_evar1 = row[163]
                 d.post_evar2 = row[164]
                 d.post_evar3 = row[165]
                 d.post_evar4 = row[166]
                 d.post_evar5 = row[167]
                 d.post_evar6 = row[168]
                 d.post_evar7 = row[169]
                 d.post_evar8 = row[170]
                 d.post_evar9 = row[171]
                 d.post_evar10 = row[172]
                 d.post_evar11 = row[173]
                 d.post_evar12 = row[174]
                 d.post_evar13 = row[175]
                 d.post_evar14 = row[176]
                 d.post_evar15 = row[177]
                 d.post_evar16 = row[178]
                 d.post_evar17 = row[179]
                 d.post_evar18 = row[180]
                 d.post_evar19 = row[181]
                 d.post_evar20 = row[182]
                 d.post_evar21 = row[183]
                 d.post_evar22 = row[184]
                 d.post_evar23 = row[185]
                 d.post_evar24 = row[186]
                 d.post_evar25 = row[187]
                 d.post_evar26 = row[188]
                 d.post_evar27 = row[189]
                 d.post_evar28 = row[190]
                 d.post_evar29 = row[191]
                 d.post_evar30 = row[192]
                 d.post_evar31 = row[193]
                 d.post_evar32 = row[194]
                 d.post_evar33 = row[195]
                 d.post_evar34 = row[196]
                 d.post_evar35 = row[197]
                 d.post_evar36 = row[198]
                 d.post_evar37 = row[199]
                 d.post_evar38 = row[200]
                 d.post_evar39 = row[201]
                 d.post_evar40 = row[202] 
                 d.post_evar41 = row[203]
                 d.post_evar42 = row[204]
                 d.post_evar43 = row[205]
                 d.post_evar44 = row[206]
                 d.post_evar45 = row[207]
                 d.post_evar46 = row[208]
                 d.post_evar47 = row[209]
                 d.post_evar48 = row[210]
                 d.post_evar49 = row[211]
                 d.post_evar50 = row[212]
                 d.post_evar51 = row[213]
                 d.post_evar52 = row[214]
                 d.post_evar53 = row[215]
                 d.post_evar54 = row[216]
                 d.post_evar55 = row[217]
                 d.post_evar56 = row[218]
                 d.post_evar57 = row[219]
                 d.post_evar58 = row[220]
                 d.post_evar59 = row[221]
                 d.post_evar60 = row[222]
                 d.post_evar61 = row[223]
                 d.post_evar62 = row[224]
                 d.post_evar63 = row[225]
                 d.post_evar64 = row[226]
                 d.post_evar65 = row[227]
                 d.post_evar66 = row[228]
                 d.post_evar67 = row[229]
                 d.post_evar68 = row[230]
                 d.post_evar69 = row[231]
                 d.post_evar70 = row[232]
                 d.post_evar71 = row[233]
                 d.post_evar72 = row[234]
                 d.post_evar73 = row[235]
                 d.post_evar74 = row[236]
                 d.post_evar75 = row[237]      
                 d.post_event_list = row[238]
                 d.post_hier1 = row[239]
                 d.post_hier2 = row[240]
                 d.post_hier3 = row[241]
                 d.post_hier4 = row[242]
                 d.post_hier5 = row[243]
                 d.post_java_enabled = row[244]
                 d.post_keywords = row[245]
                 d.post_mvvar1 = row[246]
                 d.post_mvvar2 = row[247]
                 d.post_mvvar3 = row[248]
                 d.post_page_event = row[249]
                 d.post_page_event_var1 = row[250]
                 d.post_page_event_var2 = row[251]
                 d.post_page_event_var3 = row[252]
                 d.post_pagename = row[253]
                 d.post_pagename_no_url = row[254]
                 d.post_page_type = row[255]
                 d.post_page_url = row[256]
                 d.post_partner_plugins = row[257]
                 d.post_persistent_cookie = row[258]
                 d.post_product_list = row[259]
                 d.post_prop1 = row[260]
                 d.post_prop2 = row[261]
                 d.post_prop3 = row[262]
                 d.post_prop4 = row[263]
                 d.post_prop5 = row[264]
                 d.post_prop6 = row[265]
                 d.post_prop7 = row[266]
                 d.post_prop8 = row[267]
                 d.post_prop9 = row[268]
                 d.post_prop10 = row[269]
                 d.post_prop11 = row[270]
                 d.post_prop12 = row[271]
                 d.post_prop13 = row[272]
                 d.post_prop14 = row[273]
                 d.post_prop15 = row[274]
                 d.post_prop16 = row[275]
                 d.post_prop17 = row[276]
                 d.post_prop18 = row[277]
                 d.post_prop19 = row[278]
                 d.post_prop20 = row[279]
                 d.post_prop21 = row[280]
                 d.post_prop22 = row[281]
                 d.post_prop23 = row[282]
                 d.post_prop24 = row[283]
                 d.post_prop25 = row[284]
                 d.post_prop26 = row[285]
                 d.post_prop27 = row[286]
                 d.post_prop28 = row[287]
                 d.post_prop29 = row[288]
                 d.post_prop30 = row[289]
                 d.post_prop31 = row[290]
                 d.post_prop32 = row[291]
                 d.post_prop33 = row[292]
                 d.post_prop34 = row[293]
                 d.post_prop35 = row[294]
                 d.post_prop36 = row[295]
                 d.post_prop37 = row[296]
                 d.post_prop38 = row[297]
                 d.post_prop39 = row[298]
                 d.post_prop40 = row[299] 
                 d.post_prop41 = row[300]
                 d.post_prop42 = row[301]
                 d.post_prop43 = row[302]
                 d.post_prop44 = row[303]
                 d.post_prop45 = row[304]
                 d.post_prop46 = row[305]
                 d.post_prop47 = row[306]
                 d.post_prop48 = row[307]
                 d.post_prop49 = row[308]
                 d.post_prop50 = row[309]
                 d.post_prop51 = row[310]
                 d.post_prop52 = row[311]
                 d.post_prop53 = row[312]
                 d.post_prop54 = row[313]
                 d.post_prop55 = row[314]
                 d.post_prop56 = row[315]
                 d.post_prop57 = row[316]
                 d.post_prop58 = row[317]
                 d.post_prop59 = row[318]
                 d.post_prop60 = row[319]
                 d.post_prop61 = row[320]
                 d.post_prop62 = row[321]
                 d.post_prop63 = row[322]
                 d.post_prop64 = row[323]
                 d.post_prop65 = row[324]
                 d.post_prop66 = row[325]
                 d.post_prop67 = row[326]
                 d.post_prop68 = row[327]
                 d.post_prop69 = row[328]
                 d.post_prop70 = row[329]
                 d.post_prop71 = row[330]
                 d.post_prop72 = row[331]
                 d.post_prop73 = row[332]
                 d.post_prop74 = row[333]
                 d.post_prop75 = row[334]
                 d.post_purchaseid = row[335]
                 d.post_referrer = row[336]
                 d.post_search_engine = row[337]
                 d.post_state = row[338]
                 d.post_survey = row[339]
                 d.post_tnt = row[340]
                 d.post_transactionid = row[341]
                 d.post_t_time_info = row[342]
                 d.post_visid_high = row[343]
                 d.post_visid_low = row[344]
                 d.post_visid_type = row[345]
                 d.post_zip = row[346]
                 d.p_plugins = row[347]
                 # d.prev_page = row[348]
                 d.product_list = row[349]
                 d.product_merchandising = row[350]
                 d.prop1 = row[351]
                 d.prop2 = row[352]
                 d.prop3 = row[353]
                 d.prop4 = row[354]
                 d.prop5 = row[355]
                 d.prop6 = row[356]
                 d.prop7 = row[357]
                 d.prop8 = row[358]
                 d.prop9 = row[359]
                 d.prop10 = row[360]
                 d.prop11 = row[361]
                 d.prop12 = row[362]
                 d.prop13 = row[363]
                 d.prop14 = row[364]
                 d.prop15 = row[365]
                 d.prop16 = row[366]
                 d.prop17 = row[367]
                 d.prop18 = row[368]
                 d.prop19 = row[369]
                 d.prop20 = row[370]
                 d.prop21 = row[371]
                 d.prop22 = row[372]
                 d.prop23 = row[373]
                 d.prop24 = row[374]
                 d.prop25 = row[375]
                 d.prop26 = row[376]
                 d.prop27 = row[377]
                 d.prop28 = row[378]
                 d.prop29 = row[379]
                 d.prop30 = row[380]
                 d.prop31 = row[381]
                 d.prop32 = row[382]
                 d.prop33 = row[383]
                 d.prop34 = row[384]
                 d.prop35 = row[385]
                 d.prop36 = row[386]
                 d.prop37 = row[387]
                 d.prop38 = row[388]
                 d.prop39 = row[389]
                 d.prop40 = row[390] 
                 d.prop41 = row[391]
                 d.prop42 = row[392]
                 d.prop43 = row[393]
                 d.prop44 = row[394]
                 d.prop45 = row[395]
                 d.prop46 = row[396]
                 d.prop47 = row[397]
                 d.prop48 = row[398]
                 d.prop49 = row[399]
                 d.prop50 = row[400]
                 d.prop51 = row[401]
                 d.prop52 = row[402]
                 d.prop53 = row[403]
                 d.prop54 = row[404]
                 d.prop55 = row[405]
                 d.prop56 = row[406]
                 d.prop57 = row[407]
                 d.prop58 = row[408]
                 d.prop59 = row[409]
                 d.prop60 = row[410]
                 d.prop61 = row[411]
                 d.prop62 = row[412]
                 d.prop63 = row[413]
                 d.prop64 = row[414]
                 d.prop65 = row[415]
                 d.prop66 = row[416]
                 d.prop67 = row[417]
                 d.prop68 = row[418]
                 d.prop69 = row[419]
                 d.prop70 = row[420]
                 d.prop71 = row[421]
                 d.prop72 = row[422]
                 d.prop73 = row[423]
                 d.prop74 = row[424]
                 d.prop75 = row[425] 
                 d.purchaseid = row[426]
                 d.quarterly_visitor = row[427]
                 d.ref_domain = row[428]
                 d.referrer = row[429]
                 d.ref_type = row[430]
                 d.resolution = row[431]
                 d.sampled_hit = row[432]
                 d.search_engine = row[433]
                 d.search_page_num = row[434]
                 d.secondary_hit = row[435]
                 d.service = row[436]
                 d.sourceid = row[437]
                 d.s_resolution = row[438]
                 d.state = row[439]
                 d.stats_server = row[440]
                 d.tnt = row[441]
                 d.tnt_post_vista = row[442]
                 d.transactionid = row[443]
                 d.truncated_hit = row[444]
                 d.t_time_info = row[445]
                 d.ua_color = row[446]
                 d.ua_os = row[447]
                 d.ua_pixels = row[448]
                 d.user_agent = row[449]
                 d.user_hash = row[450]
                 d.userid = row[451]
                 d.username = row[452]
                 d.user_server = row[453]
                 d.va_closer_detail = row[454]
                 d.va_closer_id = row[455]
                 d.va_finder_detail = row[456]
                 d.va_finder_id = row[457]
                 d.va_instance_event = row[458]
                 d.va_new_engagement = row[459]
                 d.visid_high = row[460]
                 d.visid_low = row[461]
                 d.visid_new = row[462]
                 d.visid_timestamp = row[463]
                 d.visid_type = row[464]
                 d.visit_keywords = row[465]
                 d.visit_num = row[466]
                 d.visit_page_num = row[467]
                 d.visit_referrer = row[468]
                 d.visit_search_engine = row[469]
                 d.visit_start_pagename = row[470]
                 d.visit_start_page_url = row[471]
                 d.visit_start_time_gmt = row[472]
                 d.weekly_visitor = row[473]
                 d.yearly_visitor = row[474]
                 d.zip = row[475]
                 d.save!
                rescue Exception => e
                  @log.info("This file has a problem with a row: #{@proc_row}")
                  @log.info("This is the problem: #{e.message}")
                  # @log.info("This row is a problem: #{@proc_row}")
                  next
                end 
                 # @log.info("We loaded a bunch of rows into illu.datafeeds")
             end
               @log.info("Loaded all files into MySQL database illu.datafeeds")
           rescue Exception => e
                 @log.warn("Unable to process the data feed: #{file} because #{e.message}")
                 next
           end
        end
      end

      # remove work files
=begin
      begin
        Dir["#{@data_path}*.tsv"].each do |file|  
            begin
              FileUtils.remove(file)
              @log.info("Deleted file #{file}")
            rescue Exception => e
              @log.warn("Unable to delete file: #{file} because #{e.message}")
            end
        end
      end
=end
  end
end



