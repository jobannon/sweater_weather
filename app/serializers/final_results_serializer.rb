class FinalResultsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :type, :start, :end, :travel_time, :summary, :business_name, :business_address 
end
