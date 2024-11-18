Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:index, :new, :create, :show, :edit, :update] do
    resources :schedules, only: [:index, :new, :create, :edit, :update]
    resources :locations, only: [:index, :new, :create, :edit, :update]
  end
end
