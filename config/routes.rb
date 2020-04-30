Rails.application.routes.draw do
  root to: "rents#new"
  resources :rents
end
