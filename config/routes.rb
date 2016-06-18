Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :load_funds_transactions

  resources :users, only: [:index, :show] do
    member do
      get :lock
    end
  end

  root to: 'users#index'
end
