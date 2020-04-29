Rails.application.routes.draw do

 namespace "api" do 
    namespace "v1" do 
      get "/forecast", to: "forecast#show"
      get "/backgrounds", to: "backgrounds#show"
      get "/munchies", to: "munchies#show"
      post "/road_trip", to: "road_trip#show" 

      post "/users", to: "user#create"
      post "/sessions", to: "sessions#create"
    end
  end
end
