class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :sex
      t.integer :age

      t.timestamps
    end

    create_table :illnesses_patients, :id => false do |t|
      t.references :illness, :patient
    end

    create_table :medicaments_patients, :id => false do |t|
      t.references :medicament, :patient
    end
  end
end
