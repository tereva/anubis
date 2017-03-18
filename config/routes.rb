Rails.application.routes.draw do
  resources :sites do
    get 'trash_it', :on => :member  
    get 'standby_it', :on => :member  
  end
  resources :categories
  resources :sessions
  #resources :trash_it


  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'home' =>  'sites#standby'
  get 'sites_valid' => 'sites#valid'
  get 'sites_standby' => 'sites#standby'
  get 'sites_trash' => 'sites#trash'

  root to: 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
