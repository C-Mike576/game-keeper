Rails.application.routes.draw do
    
  delete '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new', as: '/login'
  post '/login', to: 'sessions#create'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :gamemasters, only: [:new, :create, :show, :edit, :update] do
    resources :notes
  end

  resources :players, only: [:new, :create, :show, :edit, :update] do
    resources :notes 
  end

  resources :notes
  resources :users, only: [:show, :new, :create]
end
