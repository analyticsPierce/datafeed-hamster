class AddHitidHighToDatafeeds < ActiveRecord::Migration
  def change
    add_column :datafeeds, :hitid_high, :text
  end
end
