Rails.application.routes.draw do
  
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'orders/edit'
    get 'orders/update'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  
  namespace :admin do
    root to: "homes#top"
    resources :items
    resources :customers
    resources :genres
    
  end
  
  
  scope module: :public do
    
    root to: "homes#top"
    get 'homes/about'
    resources :addresses
    resources :orders
    resources :cart_items
    resources :customers
    resources :items
    
  end
 
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
