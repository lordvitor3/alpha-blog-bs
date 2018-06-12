Rails.application.routes.draw do
  resources :articles
  resources :articles2
  resources :users
  resources :categories, except: [:destroy]

  # For details on the  DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get  'about', to: 'pages#about'



  get 'signup', to: 'users#new'
  resources :users
  get  'fibonnaci', to: 'users#fibonnaci'
  get  'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
