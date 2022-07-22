Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'list#index'

  resources :list, only: [:index, :show, :view, :new, :create, :edit, :search, :destroy]

  resources :user, only: [:show, :new, :create]

  get '/lists/' => 'list#index'
  get '/lists/:id' => 'list#show'

  get '/user' => 'user#show'

  post '/list/new' => 'list#new'
  post '/list/:id/delete' => 'list#destroy'

  put '/list/:id/edit' => 'list#edit'
  put '/list/:id/edit/search-movie' => 'list#search'

end
