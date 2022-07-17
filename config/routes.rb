Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'list#index'

  resources :lists, only: [:index, :show, :new, :create, :edit, :search, :destroy]

  resources :users, only: [:index, :new, :create]

  get '/list' => 'list#index'
  get '/list/:id' => 'list#show'

  get '/user' => 'user#index'
  get '/user/:id/lists' => 'user#show'

  post '/list/add' => 'list#new'
  post '/list/:id/edit' => 'list#edit'
  post '/list/:id/delete' => 'list#destroy'
  post '/list/search' => 'list#search'

end
