class RemoveVaCloserSerDetailFromDatafeeds < ActiveRecord::Migration
  def change
    remove_column :datafeeds, :va_closer_ser_detail, :text
  end
end
