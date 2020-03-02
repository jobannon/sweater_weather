class YelpGetterJson 

  def initialize 
  end

  def get_businesses_with_coordinates(lat,lng, term, time_adjust)
    results = conn.get('businesses/search') do |c|
      c.params['term']= term 
      c.params['latitude'] = lat #'37.786882' #lat
      c.params['longitude']= lng #'-122.399972' #lng
      c.params['open_at']= time_adjust
    end
    clean_json(results)
  end

  # private

  def conn
    Faraday.new("https://api.yelp.com/v3") do |config|
      config.headers['Authorization'] = "Bearer " + ENV['YELP_API_KEY']
   end
  end

  def clean_json(incoming)
    JSON.parse(incoming.body, symbolize_names: true)
  end
end
