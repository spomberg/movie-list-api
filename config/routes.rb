Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'list#index'

  resources :list, only: [:index, :show, :view, :new, :create, :edit, :search, :destroy]

  resources :user, only: [:show, :new, :create]

  get 'api/lists/' => 'list#index'
  get 'api/lists/:id' => 'list#show'

  get 'api/user' => 'user#show'

  post 'api/list/new' => 'list#new'

  put 'api/list/:id/edit' => 'list#edit'
  put 'api/list/search-movie' => 'list#search'
  
  delete 'api/list/:id/delete' => 'list#destroy'
  
end
