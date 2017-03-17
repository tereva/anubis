Rails.application.routes.draw do
  resources :sites
  resources :categories
  resources :sessions

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'home' => 'sites#index'

  root to: 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
