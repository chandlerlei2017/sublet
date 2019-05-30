Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_out', to: 'devise/sessions#destroy'
    get "sign_up" => "devise/registrations#new"
  end

  get 'dashboard', to: 'dashboard#show', as: :user_root

  get 'listings/new', to: 'listings#new'
  get 'listing', to: 'listings#show'
  post 'listings/create', to: 'listings#create'
  post 'listings/destroy', to: 'listings#destroy'
  post 'listings/save', to: 'listings#save'
  post 'listings/save/remove', to: 'listings#save_remove'
end
