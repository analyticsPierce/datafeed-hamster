class RemovePageEventEventVar3ToDatafeeds < ActiveRecord::Migration
  def change
    remove_column :datafeeds, :page_event_event_var3, :text
  end
end
