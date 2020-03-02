class YelpController
  def show
    temp_holder = YelpGetter.new.get_businesses_with_coordinates(1,1)
  end
end
