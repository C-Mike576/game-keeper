Rails.application.routes.draw do
    
  delete '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  resources :gamemasters do
    resources :notes
  end

  resources :players do
    resources :notes 
  end

  resources :notes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
