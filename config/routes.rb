# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  ActiveAdmin.routes(self)
  get 'pages/show'
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
  root to: 'products#index'

  resource :carts, only: [:show]
  resources :order_details

  get 'categories', to: 'categories#index', as: 'categories'
  get 'categories/:id', to: 'categories#show', id: /\d+/, as: 'category'
  # resource 'products', only: %i[index show]
  get 'products', to: 'products#index', as: 'products'
  get 'products/:id', to: 'products#show', id: /\d+/, as: 'product'

  get 'search', to: 'products#search', as: 'search'

  get 'about_us', to: 'pages#about', as: 'about'
  get 'contact_us', to: 'pages#contact', as: 'contact'
end
