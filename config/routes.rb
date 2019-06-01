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

  post 'listings/save', to: 'saved_listings#save'
  post 'listings/save/remove', to: 'saved_listings#save_remove'

  post 'listings/apply', to: 'applied_listings#apply'
  post 'listings/unapply', to: 'applied_listings#unapply'

  get 'listings/my', to: 'show_listings#my_listings', as: :my_listings
  get 'listings/all', to: 'show_listings#all_listings', as: :all_listings
  get 'listings/saved', to: 'show_listings#saved_listings', as: :saved_listings
  get 'listings/applied', to: 'show_listings#applied_listings', as: :applied_listings

  post 'comments/create', to: 'comments#create'
  delete 'comments/delete', to: 'comments#delete'
end
