Rails.application.routes.draw do
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
