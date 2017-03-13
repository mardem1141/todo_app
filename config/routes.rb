Rails.application.routes.draw do
  #get 'users/new'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :projects, only: [:create, :destroy]
  root  'users#show'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
