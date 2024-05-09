Rails.application.routes.draw do
  root :to => redirect("books#index")

  resources :books do
    collection do
      post :index
    end
  end
end
