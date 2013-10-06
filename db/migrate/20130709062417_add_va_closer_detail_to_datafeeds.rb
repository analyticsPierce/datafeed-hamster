class AddVaCloserDetailToDatafeeds < ActiveRecord::Migration
  def change
    add_column :datafeeds, :va_closer_detail, :text
  end
end
