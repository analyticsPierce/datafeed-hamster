class AddCodeVerToDatafeeds < ActiveRecord::Migration
  def change
    add_column :datafeeds, :code_ver, :text
  end
end
