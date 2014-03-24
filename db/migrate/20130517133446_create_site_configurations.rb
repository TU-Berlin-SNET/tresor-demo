class CreateSiteConfigurations < ActiveRecord::Migration
  def change
    create_table :site_configurations do |t|
      t.string :name, :null => false
      t.boolean :geolocation_login, :default => false

      t.timestamps
    end
  end
end
