class CreateBarcodes < ActiveRecord::Migration
  def change
    create_table :barcodes do |t|
      t.integer :number, :null => false, :uniq => true
      t.datetime :expiration, :null => false
      t.integer :patient_id

      t.timestamps
    end
  end
end
