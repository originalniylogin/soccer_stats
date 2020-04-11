Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :teams, only: [:index]
  end
end
