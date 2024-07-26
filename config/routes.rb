Rails.application.routes.draw do

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
    resources :orders
    
  end
  
  
  scope module: :public do
    
    root to: "homes#top"
    get 'homes/about'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :addresses
    resources :orders do
      collection do
        
        post 'confirm', as: 'confirm'
        post 'finalize', as: 'finalize'
      end
    end
    get '/orders/completed' => 'orders#completed'
    resources :cart_items do
      collection do
        delete 'destroy_all'
      end
    end
    resources :customers
    resources :items
    
  end
 
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
