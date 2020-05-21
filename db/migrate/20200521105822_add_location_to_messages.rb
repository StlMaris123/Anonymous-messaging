class AddLocationToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :latitude, :float
    add_column :messages, :longitude, :float
    add_column :messages, :address, :string
  end
end
