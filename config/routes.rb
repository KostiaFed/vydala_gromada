Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root 'books#index'

  resources :books, only: %i[index show new create edit]
  resources :users, only: %i[show]
end
