class YelpGetter 
  attr_reader :name, :address

  def initialize(incm_json)
    @name = incm_json[:businesses].first[:name]
    @address = incm_json[:businesses].first[:location][:display_address].first
  end
end
