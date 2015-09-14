class Reservation < ActiveRecord::Base
	validates :name, presence: true
	validates :capacity, presence: true
	belongs_to :restaurant
end
