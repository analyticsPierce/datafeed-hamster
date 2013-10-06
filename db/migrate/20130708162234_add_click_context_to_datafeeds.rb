class AddClickContextToDatafeeds < ActiveRecord::Migration
  def change
    add_column :datafeeds, :click_context, :text
  end
end
