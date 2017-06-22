Rails.application.routes.draw do
  root to: 'documents#index'
  
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  get 'users/sign_up' => redirect('users/sign_in')
  get 'users/new' => redirect('users/sign_in')

  resources :users
  resources :categories
  resources :documents do
    collection do
      get 'get_safe_html'
    end
  end
  resources :suggestions
  resources :likes
  resources :categories_documents
  resources :edit_permissions
  post 'documents/ajaxFunction'
end
