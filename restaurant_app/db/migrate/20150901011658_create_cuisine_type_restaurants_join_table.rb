class CreateCuisineTypeRestaurantsJoinTable < ActiveRecord::Migration
  def change
  	create_table :cuisine_types_restaurants do |t|
  		t.integer :cuisine_type_id
  		t.integer :restaurant_id
  	end
  end
end
