class RemoveHitidHighFromDatafeeds < ActiveRecord::Migration
  def change
    remove_column :datafeeds, :hitid_highigh, :text
  end
end
