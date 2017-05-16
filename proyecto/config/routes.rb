Rails.application.routes.draw do
  resources :users
  resources :categories
  resources :documents
  resources :categories_documents
end
