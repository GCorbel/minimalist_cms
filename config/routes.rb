Rails.application.routes.draw do
  match ':id', to: "pages#show"
  resources :pages, only: :update
end
