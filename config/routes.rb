Rails.application.routes.draw do
  root to: "rents#new"
  resources :rents do
    collection do
      post :confirm
    end
  end
end
