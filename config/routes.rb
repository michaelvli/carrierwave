CarrierWave::Application.routes.draw do

  resources :videos, only: [:index, :new, :create, :destroy]
  root "videos#index"
  
  post "zencoder" => "zencoder#create", :as => "zencoder" # used to direct the "completed job" notification from zencoder
end