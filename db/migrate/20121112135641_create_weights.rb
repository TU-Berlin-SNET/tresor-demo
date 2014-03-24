class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.float :value
      t.integer :patient_id
      t.datetime :date

      t.timestamps
    end
  end
end
