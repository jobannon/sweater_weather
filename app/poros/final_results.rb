class FinalResults
  attr_reader :id, :type, :start, :end, :travel_time, :summary, :business_name, :business_address

  def initialize(location, travel_time, json_forecast, yelp_obj)
    @id = nil 
    @type = "munchie"

    @start = location[:start]
    @end = location[:end]
    @travel_time = travel_time
    @summary = json_forecast[:hourly][:summary]

    @business_name = yelp_obj.name
    @business_address = yelp_obj.address

  end
end
