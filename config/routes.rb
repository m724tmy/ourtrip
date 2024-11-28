Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"

  resources :rooms do
    resources :schedules do
      collection do
        post 'add_from_location'
      end
    end
    resources :locations

    member do
      delete :leave
    end

    member do
      get 'chatgpt', to: 'openais#index'
      post 'chatgpt', to: 'openais#create'
    end
  end
end