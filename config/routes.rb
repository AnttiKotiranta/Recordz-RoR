Recordz::Application.routes.draw do

  resources :users
  resources :records
  resources :bands
  resources :artists
  resource :session, only: [:new, :create, :delete]
  resources :artists do
  	put 'add_bands', on: :member
	put 'add_records', on: :member
  end
  resources :bands do
	put 'add_artists', on: :member
	put 'add_records', on: :member
  end

  root 'records#index'
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
end
