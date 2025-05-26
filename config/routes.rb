Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root 'books#index'

  resources :books do
    resources :comments, only: [:create]
    resources :payments, only: [:create]
  end

  resources :users, only: %i[show]

  resources :payments do
    collection do
      post :callback
      post :callback_page
      get :callback_success
    end
  end
end
