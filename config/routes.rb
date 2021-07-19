Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  "projects#index"
  resources :users , only: [:create, :new]
  resources :projects, only: [:index, :grouped, :show, :create, :new, :destroy, :edit]
  resources :sessions, only: [:create, :new, :destroy]
  resources :groups do 
    resources :projects
  end
 get '/grouped', to: 'projects#grouped'
 get '/addition', to: 'groups#addition'
 end
