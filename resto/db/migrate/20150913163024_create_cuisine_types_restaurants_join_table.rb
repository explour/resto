class CreateCuisineTypesRestaurantsJoinTable < ActiveRecord::Migration
  def self.up
  	create_table :cuisine_types_restaurants, :id => false do |t|
  		t.integer :cuisine_type_id
  		t.integer :restaurant_id
  	end

  	add_index :cuisine_types_restaurants, [:cuisine_type_id, :restaurant_id], :name => 'restaurant_type_index'

  	add_column :cuisine_types, :cuisine_type_id, :integer
  	add_column :restaurants, :restaurant_id, :integer


  end

  def self.down
  	drop_table :cuisine_types_restaurants
  end

end
