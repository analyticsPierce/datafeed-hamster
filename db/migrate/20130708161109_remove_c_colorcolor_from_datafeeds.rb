class RemoveCColorcolorFromDatafeeds < ActiveRecord::Migration
  def change
    remove_column :datafeeds, :c_colorcolor, :text
  end
end
