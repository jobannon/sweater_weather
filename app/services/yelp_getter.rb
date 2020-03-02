class YelpGetter 

  def initialize 
  end

  def get_businesses_with_coordinates(lat,lng)
    conn.get('businesses/search') do |c|
      c.params['term']= 'delis'
      c.params['latitude'] = '37.786882' #lat
      c.params['longitude']= '-122.399972' #lng
    end
  end

  # private

  def conn
    Faraday.new("https://api.yelp.com/v3") do |config|
      config.headers['Authorization'] = "Bearer " + ENV['YELP_API_KEY']
   end
  end

  def get_json
    JSON.parse
  end
end
