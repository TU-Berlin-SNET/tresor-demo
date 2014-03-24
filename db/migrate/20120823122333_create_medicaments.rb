class CreateMedicaments < ActiveRecord::Migration
  def change
    create_table :medicaments do |t|
      t.string :name, :null => false
      t.string :description

      t.timestamps
    end
  end
end
