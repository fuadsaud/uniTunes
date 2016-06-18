Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :purchases, only: [:index, :create]
  resources :load_funds_transactions
  resources :media

  resources :admin_media, only: [:index, :show, :destroy]
  resources :users, only: [:index, :show] do
    member do
      get :lock
    end
  end

  root to: 'load_funds_transactions#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if ENV_POLICY.allow?('LETTER_OPENER')
end
