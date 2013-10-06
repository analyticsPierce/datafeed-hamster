class AddPartnerPluginsToDatafeeds < ActiveRecord::Migration
  def change
    add_column :datafeeds, :partner_plugins, :text
  end
end
