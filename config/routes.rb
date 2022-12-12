Rails.application.routes.draw do
  post 'track' => 'track#create', as: :tracks
  resources :albums do
  get '/myalbums/:page', action: :myalbums, on: :collection , as: :my
  get '/myalbums/', action: :myalbums, on: :collection 
  end
  devise_for :users
   root "home#index"
end
