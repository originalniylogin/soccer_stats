Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :teams, only: [:index]

    resources :players, only: [:index] do
      post :set_statistic, on: :member
    end
  end
end
