class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :description_general
      t.string :description_technical
      t.float :costs
      t.string :server_location
      t.integer :owner_id

      t.timestamps
    end
  end
end
