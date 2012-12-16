Rails.application.routes.draw do
  match ':path', to: "pages#show"
end
