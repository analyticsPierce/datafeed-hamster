class AddPageUrlToDatafeeds < ActiveRecord::Migration
  def change
    add_column :datafeeds, :page_url, :text
  end
end
