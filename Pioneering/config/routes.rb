Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:create, :show, :update, :destroy] do
    resources :artworks, only: :index
  end
  # get 'users', to: 'users#index'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # post 'users', to: 'users#create'
  # get 'users/:id', to: 'users#show', as: 'user'
  # get 'users/:id/edit', to: 'users#edit'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  resources :artworks, only: [:index, :create, :show, :update, :destroy]

  resources :artworks_shares, only: [:create, :delete]

end
