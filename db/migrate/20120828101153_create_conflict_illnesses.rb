class CreateConflictIllnesses < ActiveRecord::Migration
  def change
    create_table :conflict_illnesses do |t|
      t.string :description
      t.integer :illness_id, :null => false
      t.integer :medicament_id, :null => false

      t.timestamps
    end
  end
end
