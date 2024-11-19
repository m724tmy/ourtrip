Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms do
    resources :schedules
    resources :locations, only: [:index, :new, :create, :edit, :update]
    member do
      delete :leave
    end
  end
end
