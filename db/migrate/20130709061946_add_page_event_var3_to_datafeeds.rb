class AddPageEventVar3ToDatafeeds < ActiveRecord::Migration
  def change
    add_column :datafeeds, :page_event_var3, :text
  end
end
