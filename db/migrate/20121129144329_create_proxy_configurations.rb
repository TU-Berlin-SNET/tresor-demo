class CreateProxyConfigurations < ActiveRecord::Migration
  def change
    create_table :proxy_configurations do |t|
      t.string :name
      t.boolean :ad_linkup
      t.boolean :ldap_linkup
      t.boolean :location_services
      t.boolean :logging

      t.timestamps
    end
  end
end
