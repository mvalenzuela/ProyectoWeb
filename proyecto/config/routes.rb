Rails.application.routes.draw do
  root to: 'documents#index'
  devise_for :users
  resources :users
  resources :categories
  resources :documents do
    get 'edit_permissions', to: 'documents#edit_permissions', on: :member
  end
  get 'get_safe_html', to: 'documents#get_safe_html'

  resources :categories_documents
  resources :edit_permissions
end
