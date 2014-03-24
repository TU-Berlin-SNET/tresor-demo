class AddHeightToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :height, :integer
  end
end
