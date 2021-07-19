Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  "projects#index"
  resources :users , only: [:create, :new]
  resources :projects, only: [:index, :grouped, :show, :create, :new, :destroy, :edit, :update]
  resources :sessions, only: [:create, :new, :destroy]
  resources :groups do 
    resources :projects
  end
  resources :projects do
    resources :reviews
  end
 get '/grouped', to: 'projects#grouped'
 get '/addition', to: 'groups#addition'
 end
