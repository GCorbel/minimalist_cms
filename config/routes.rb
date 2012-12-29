Rails.application.routes.draw do
  root to: "pages#show"
  get ':id', to: "pages#show"
  resources :pages, only: [:edit, :update, :new, :create]
end
