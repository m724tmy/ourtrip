Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms do
    resources :schedules do
      member do
        post 'add_from_location'
      end
    end
    resources :locations
    member do
      delete :leave
    end
  end
end
