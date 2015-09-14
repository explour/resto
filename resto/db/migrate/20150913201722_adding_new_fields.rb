class AddingNewFields < ActiveRecord::Migration
  def change
  	add_column :restaurants, :capacity, :integer
  	add_column :restaurants, :address_line_1, :string
  	add_column :restaurants, :address_line_2, :string
  	add_column :restaurants, :city, :string
  	add_column :restaurants, :province, :string
  	add_column :restaurants, :description, :text
  	add_column :restaurants, :foursquare_id, :string
  	add_column :reservations, :party_size, :integer
  end
end