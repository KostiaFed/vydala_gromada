Rails.application.routes.draw do
  scope ENV.fetch('RAILS_RELATIVE_URL_ROOT', '/') do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
    }

    root 'books#index'

    resources :books do
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
end
