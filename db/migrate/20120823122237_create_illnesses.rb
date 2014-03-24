class CreateIllnesses < ActiveRecord::Migration
  def change
    create_table :illnesses do |t|
      t.string :name, :null => false
      t.string :description

      t.timestamps
    end
  end
end
