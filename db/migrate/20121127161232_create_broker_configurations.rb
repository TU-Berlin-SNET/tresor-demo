class CreateBrokerConfigurations < ActiveRecord::Migration
  def change
    create_table :broker_configurations do |t|
      t.string :name

      t.timestamps
    end
  end
end
