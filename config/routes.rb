Rails.application.routes.draw do
  resources :sites do
    get 'trash_it', :on => :member  
    get 'standby_it', :on => :member  
    get 'hit_it', :on => :member 
  end

 resources :categories do
    get 'hit_it', :on => :member 
  end

  resources :categories
  resources :sessions
  #resources :trash_it


  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'home' =>  'static_pages#home'
  get 'sites_valid' => 'sites#valid'
  get 'sites_standby' => 'sites#standby'
  get 'sites_trash' => 'sites#trash'
  get 'search' => 'sites#search'


  root to: 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
