Rails.application.routes.draw do
  root to: "pages#show"
  get ':id', to: "pages#show"
  resources :pages
  put 'pages/:id/publish' => 'pages#publish', as: :publish_page
  put 'pages/:id/unpublish' => 'pages#unpublish', as: :unpublish_page
  put 'pages/:id/home' => 'pages#home', as: :home_page
end
