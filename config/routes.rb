Rails.application.routes.draw do
  root to: "pages#show"
  get ':id', to: "pages#show"
  resources :pages
  get 'pages/:id/publish' => 'pages#publish', as: :publish_page
  get 'pages/:id/unpublish' => 'pages#unpublish', as: :unpublish_page
  get 'pages/:id/home' => 'pages#home', as: :home_page
end
