class CreateConflictMeds < ActiveRecord::Migration
  def change
    create_table :conflict_meds do |t|
      t.string :description
      t.integer :medicament_id
      t.integer :med_id

      t.timestamps
    end
  end
end
