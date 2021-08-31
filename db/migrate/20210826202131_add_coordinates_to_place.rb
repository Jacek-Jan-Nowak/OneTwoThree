class AddCoordinatesToPlace < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :latitude, :float
    add_column :places, :longitude, :float
  end
end
