Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'lists#index'

  resources :lists, only: [:index, :show, :new, :create, :edit, :search, :destroy]

  resources :users, only: [:index, :new, :create]

  get '/lists' => 'lists#index'
  get '/lists/:id' => 'lists#show'

  get '/users' => 'users#index'
  get '/users/:id/lists' => 'users#show'

  post '/add-list' => 'lists#new'
  post '/lists/:id/edit' => 'lists#edit'
  post '/lists/:id/delete' => 'lists#destroy'
  post '/lists/search' => 'lists#search'

end
