class AddLatitudesAndLongitudesTo < ActiveRecord::Migration
  def self.up
    add_column :fotos, :latitudes,  :float
	add_column :fotos, :longitudes, :float
  end

  def self.down
    remove_column :fotos, :latitudes
	remofe_column :fotos, :longitudes
  end
end
