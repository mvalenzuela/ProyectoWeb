Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  resources :users
  resources :categories
  resources :documents do
    get 'edit_permissions', to: 'documents#edit_permissions', on: :member
  end
  resources :categories_documents
  resources :edit_permissions 
