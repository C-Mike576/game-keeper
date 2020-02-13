Rails.application.routes.draw do
  delete '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#create'
  resources :notes
  resources :players
  resources :gamemasters
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
