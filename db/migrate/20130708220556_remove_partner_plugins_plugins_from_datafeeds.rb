class RemovePartnerPluginsPluginsFromDatafeeds < ActiveRecord::Migration
  def change
    remove_column :datafeeds, :partner_pluginsplugins, :text
  end
end
