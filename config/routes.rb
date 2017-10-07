Rails.application.routes.draw do
  
  get 'sessions/new'

  root 'staticpages#home'
  get  '/home', to: 'staticpages#home'
  
  get  '/about',   to: 'staticpages#about'

  get  '/help', to: 'staticpages#help'

  get  '/signup',  to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :comments
  resources :likes
  resources :musics
  #root 'musics#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
