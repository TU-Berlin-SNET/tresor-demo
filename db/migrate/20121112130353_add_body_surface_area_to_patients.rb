class AddBodySurfaceAreaToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :body_surface_area, :float
  end
end
