Rails.application.routes.draw do

  

  post 'track' => 'track#create', as: :tracks
  delete 'track/:album_id/:track_id' => 'track#destroy', as: :track_destroy
  resources :albums do
  get '/myalbums/:page', action: :myalbums, on: :collection , as: :my
  get '/myalbums/', action: :myalbums, on: :collection 
  end
  devise_for :users
   root "home#index"
end
