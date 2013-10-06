class AddCColorToDatafeeds < ActiveRecord::Migration
  def change
    add_column :datafeeds, :c_color, :text
  end
end
