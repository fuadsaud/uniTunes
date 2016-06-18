Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :load_funds_transactions

  resources :users, only: [:index, :show] do
    member do
      get :lock
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if ENV_POLICY.allow?('LETTER_OPENER')
end
