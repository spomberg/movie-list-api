Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'lists#index'

  resources :lists, only: [:index, :show, :new, :edit, :search, :destroy]

  resources :users, only: [:index]

  get '/lists' => 'lists#index'
  get '/users' => 'users#index'

  post '/add-list' => 'list#new'
  post '/edit-list' => 'list#edit'
  post '/delete-list' => 'list#destroy'
  post '/movie-search'

end
