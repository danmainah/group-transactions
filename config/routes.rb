Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  "projects#grouped"
  resources :users
  resources :projects
  resources :sessions
  resources :groups do 
    resources :projects
  end
 get '/grouped', to: 'projects#grouped'
 end
