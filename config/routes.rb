# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/show'
  # get 'products/index'
  # get 'products/show'
  # get 'categories/index'
  # get 'categories/show'
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'

  get 'categories', to: 'categories#index', as: 'categories'
  get 'categories/:id', to: 'categories#show', id: /\d+/, as: 'category'
  # resource 'products', only: %i[index show]
  get 'products', to: 'products#index', as: 'products'
  get 'products/:id', to: 'products#show', id: /\d+/, as: 'product'

  get 'search', to: 'products#search', as: 'search'

  get 'about_us', to: 'pages#about', as: 'about'
  get 'contact_us', to: 'pages#contact', as: 'contact'
end
