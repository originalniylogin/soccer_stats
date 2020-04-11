Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :teams, only: [:index]
    resources :players, only: [:index]
  end
end
