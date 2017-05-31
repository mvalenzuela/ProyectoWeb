Rails.application.routes.draw do
  devise_for :users, path: 'auth'
  devise_scope :user do
    get 'auth', to: 'devise/registrations#new'
  end
  authenticate :user do
    resources :users
    resources :categories
    resources :documents
    resources :categories_documents
    end

  root to: 'documents#index'
end
