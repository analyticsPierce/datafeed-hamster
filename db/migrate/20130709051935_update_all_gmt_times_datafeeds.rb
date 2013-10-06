class UpdateAllGmtTimesDatafeeds < ActiveRecord::Migration
  def change
    change_table :datafeeds do |t|
      t.change :t_time_info, :text
      t.change :cust_hit_time_gmt, :text
      t.change :first_hit_time_gmt, :text
      t.change :hit_time_gmt, :text
      t.change :last_hit_time_gmt, :text
      t.change :last_purchase_time_gmt, :text
      t.change :post_cust_hit_time_gmt, :text
      t.change :post_t_time_info, :text
      t.change :t_time_info, :text
      t.change :visid_timestamp, :text
      t.change :visit_start_time_gmt, :text
    end
  end
end
