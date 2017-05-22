Rails.application.routes.draw do
  resources :amps, only: [:index]

  root to: "amps#index"
end
