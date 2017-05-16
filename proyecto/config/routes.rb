Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :categories
  resources :documents
  resources :categories_documents

  root to: 'users#index'
end
