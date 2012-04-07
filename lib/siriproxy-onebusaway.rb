require 'cora'
require 'siri_objects'
require 'onebusaway_updated'

#######
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::OneBusAway < SiriProxy::Plugin
def initialize(config)
   @apiKey = config['api_keyOBA']
end

# find stops nearby a given latitude and longitude
#   - returns an array of Onebusaway::Stop instances
##stops = Onebusaway.stops_for_location(:lat => "47.66", :lon => "-122.29")
	listen_for /Nearest(?: bus)? stop/i do
		stops = ::Onebusaway.stops_for_location( :lat => "#{location.latitude}", :lon => "#{location.longitude}")
		say "The nearest bus stop is at #{stops[0]}."
	request_completed
	end
	
# find routes nearby a given latitude and longitude
#   - returns an array of Onebusaway::Route instances
##routes = Onebusaway.routes_for_location(:lat => "47.66", :lon => "-122.29")
	listen_for /Nearest(?: bus)? route/i do
		routes = ::Onebusaway.routes_for_location( :lat => "#{location.latitude}", :lon => "#{location.longitude}")
		say "The nearest bus route is #{routes[0]}."
	request_completed
	end

end