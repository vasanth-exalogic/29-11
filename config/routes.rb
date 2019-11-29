Rails.application.routes.draw do
  root "sessions#new"
  post '/sessions' => "sessions#create"
  delete '/' => "sessions#destroy", as: 'logout'
  get '/sessions' => "sessions#new"
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
