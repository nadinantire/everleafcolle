Rails.application.routes.draw do
  root 'sessions#new'
  root to: "usr#index"
  resources :sessions
  resources :usrs
  resources :tasks
  # root 'tasks#index'

  devise_for :users, controllers: {
    registrations: "registrations"
  }
  # root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :usrs
  end
end
