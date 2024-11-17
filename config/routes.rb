Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:index, :new, :create, :show] do
    resources :schedules, only: [:index, :new, :create, :edit, :update]
  end
end
