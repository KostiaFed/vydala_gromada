Rails.application.routes.draw do
  devise_for :users

  root :to => redirect("books")

  resources :books do
    collection do
      post :index
    end
  end
end
