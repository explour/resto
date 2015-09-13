class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :restaurant_id
      t.string :customer_name
      t.datetime :time
      t.timestamps null: false
    end
  end
end
