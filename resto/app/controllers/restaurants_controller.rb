class RestaurantsController < ApplicationController
	
	

	#GET /restaurants - SHOW ALL RESTAURANTS
	def index
		@restaurants = Restaurant.all
		@restaurant = Restaurant.new
	end

	#POST /restaurants - CREATE RESTAURANT
	def create
		if params[:foursquare_id] != ""
			httpbot = HTTPClient.new
			http = httpbot.get("https://api.foursquare.com/v2/venues/#{restaurant_params[:foursquare_id]}?client_id=JKIGWG2CJUOHAJ1BHL11YFIGVD3MLQW2WGNEK35EZLWAWHGM
&client_secret=ZNW4OWFODXJ50MBN1SPEKUODXMKWCH5DIWBCM3RMXNXYOCBS&v=20140806")
			data = JSON.parse(http.content)
			restaurant_params_with_4sq = {
				name: data["response"]["venue"]["name"],
				capacity: params[:capacity],
				foursquare_id: params[:foursquare_id],
				address_line_1: data["response"]["venue"]["location"]["address"],
				city: data["response"]["venue"]["location"]["city"],
				province: data["response"]["venue"]["location"]["state"],
				description: data["response"]["venue"]["photos"]["groups"][0]["items"][0]["prefix"] + "240x240" + data["response"]["venue"]["photos"]["groups"][0]["items"][0]["suffix"]
			}
		end
		Restaurant.create(restaurant_params_with_4sq)
		redirect_to action: "index"
	end

	#GET /restaurants/new - SHOW NEW FORM FOR SELECTED RESTAURANT
	def new
		@restaurant = Restaurant.new
	end

	#GET /restaurants/:id/edit - SHOW EDIT FORM FOR SELECTED RESTAURANT
	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	#GET /restaurants/:id - SHOW ONE RESTAURANT
	def show
		@restaurant = Restaurant.find(params[:id])
	end

	#PATCH /restaurant/:id - UPDATE RESTAURANT
	def update
		@restaurant = Restaurant.find(params[:id])
		if params[:foursquare_id] != ""
			httpbot = HTTPClient.new
			http = httpbot.get("https://api.foursquare.com/v2/venues/#{restaurant_params[:foursquare_id]}?client_id=JKIGWG2CJUOHAJ1BHL11YFIGVD3MLQW2WGNEK35EZLWAWHGM
&client_secret=ZNW4OWFODXJ50MBN1SPEKUODXMKWCH5DIWBCM3RMXNXYOCBS&v=20140806")
			data = JSON.parse(http.content)
			restaurant_params_with_4sq = {
				name: data["response"]["venue"]["name"],
				capacity: restaurant_params[:capacity],
				foursquare_id: restaurant_params[:foursquare_id],
				address_line_1: data["response"]["venue"]["location"]["address"],
				city: data["response"]["venue"]["location"]["city"],
				province: data["response"]["venue"]["location"]["state"],
				description: data["response"]["venue"]["photos"]["groups"][0]["items"][0]["prefix"] + "240x240" + data["response"]["venue"]["photos"]["groups"][0]["items"][0]["suffix"]
			}
		end
		@restaurant.update (restaurant_params_with_4sq)
		redirect_to action: "index"
	end

	#DELETE
	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to action: "index"
	end

	private 
	def restaurant_params
		params.require(:restaurant).permit(:name, :capacity, :foursquare_id)
	end

end
