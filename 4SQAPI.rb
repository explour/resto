require 'httpclient'
require 'json'

restaurant_params = {foursquareid: "53988841498e75c4afb950c1"}
httpbot = HTTPClient.new 

test = httpbot.get("https://api.foursquare.com/v2/venues/#{restaurant_params[:foursquareid]}?client_id=JKIGWG2CJUOHAJ1BHL11YFIGVD3MLQW2WGNEK35EZLWAWHGM
&client_secret=ZNW4OWFODXJ50MBN1SPEKUODXMKWCH5DIWBCM3RMXNXYOCBS&v=20140806")

data = JSON.parse(test.content)
puts data["response"]["venue"]