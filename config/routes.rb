Recordz::Application.routes.draw do

  resources :users
  resources :records
  resources :bands
  resources :artists
  resource :session, only: [:new, :create, :delete]

  root 'records#index'
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
end
