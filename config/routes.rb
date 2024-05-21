Rails.application.routes.draw do
  devise_for :users

  root "books#index"

  resources :books do
    collection do
      post :index
    end
  end
end
