class BackgroundGetter 
  attr_reader :id, :url

  def initialize(location) 
    @location = location
    @url =  get_photo_url
    @id = nil
  end

  def get_photo_url
    raw_json = conn.get('search/photos') do |c|
      c.params['query'] = @location
      c.params['query'] = "city"
      c.params['query'] = "skyline"
      c.params['query'] = "outside"
    end

    clean_json = get_json(raw_json)
    @url = clean_json[:results].first[:urls][:full]
  end

  private

  def conn
    Faraday.new('https://api.unsplash.com') do |config|
      config.params['client_id']= ENV['UNSPLASH_ACCESS_KEY'] 
    end
  end

  def get_json(incm_json)
    JSON.parse(incm_json.body, symbolize_names: true)
  end
end

