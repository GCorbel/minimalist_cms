Rails.application.routes.draw do
  root to: "pages#show"
  get ':id', to: "pages#show"
  resources :pages, only: [:edit, :update, :new, :create]
  get 'pages/:id/publish' => 'pages#publish', as: :publish_page
end
