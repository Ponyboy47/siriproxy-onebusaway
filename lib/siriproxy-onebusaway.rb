require 'cora'
require 'siri_objects'
require 'onebusaway_updated'

#######
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::OneBusAway < SiriProxy::Plugin
def initialize(config)
end

# find stops nearby a given latitude and longitude
#   - returns an array of Onebusaway::Stop instances
##stops = Onebusaway.stops_for_location(:lat => "47.66", :lon => "-122.29")
	listen_for /Nearest(? bus)? stop/i do
		say "Latitude is: #{location.latitude}"
		say "Longitude is: #{location.longitude}"
	request_completed
	end
	
# find routes nearby a given latitude and longitude
#   - returns an array of Onebusaway::Route instances
##routes = Onebusaway.routes_for_location(:lat => "47.66", :lon => "-122.29")
	listen_for /Nearest(? bus)? route/i do
		say "Latitude is: #{location.latitude}"
		say "Longitude is: #{location.longitude}"
	request_completed
	end

end