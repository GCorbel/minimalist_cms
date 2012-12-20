Rails.application.routes.draw do
  match ':id', to: "pages#show"
end
