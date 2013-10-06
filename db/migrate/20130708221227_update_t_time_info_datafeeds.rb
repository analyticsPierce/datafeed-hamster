class UpdateTTimeInfoDatafeeds < ActiveRecord::Migration
  def change
    change_table :datafeeds do |t|
      t.change :t_time_info, :datetime
    end
  end  
end
