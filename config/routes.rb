Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show_by_id'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  get '/posts', to: 'posts#index'
  get '/posts/:id', to: 'posts#show_by_id'
  resources :comments, :roles, :posts
  #delete '/users/:id', to: 'users#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
