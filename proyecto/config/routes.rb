Rails.application.routes.draw do
  resources :suggestions
  root to: 'documents#index'
  devise_for :users
  resources :users
  resources :categories
  resources :documents do
    collection do
      get 'get_safe_html'
    end
  end
  resources :categories_documents
  resources :edit_permissions
end
