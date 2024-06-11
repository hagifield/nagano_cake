Rails.application.routes.draw do
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'adresses/index'
    get 'adresses/edit'
    get 'adresses/update'
    get 'adresses/create'
    get 'adresses/destroy'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/create'
    get 'orders/confirm'
    get 'orders/completed'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/confirm'
    get 'customers/destroy'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  root to: "admin/items#new"
  
  namespace :admin do
    root to: "admin/sessions#new"
    resources :items
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
