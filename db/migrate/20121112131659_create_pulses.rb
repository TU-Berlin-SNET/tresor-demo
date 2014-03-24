class CreatePulses < ActiveRecord::Migration
  def change
    create_table :pulses do |t|
      t.integer :frequency
      t.integer :patient_id
      t.datetime :date

      t.timestamps
    end
  end
end
