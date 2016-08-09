Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create]
  delete '/sessions', to: 'sessions#destroy', as: 'session'

  resources :workouts, only: [:index, :show, :new, :create, :destroy] do
    resources :exercises, only: [:create, :destroy]
  end
  get '/workouts/:id/start', to: 'workouts#start', as: 'start_workout'
end
