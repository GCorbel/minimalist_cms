Rails.application.routes.draw do
  root to: "pages#show"
  match ':id', to: "pages#show"
  resources :pages, only: :update
end
