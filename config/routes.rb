Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :purchases, only: [:index, :create, :show]
  resources :load_funds_transactions

  resources :media

  get :store, to: 'stores#show', as: :default_store
  resources :stores, only: :show, param: :media_content_type

  resource :library, only: :show

  resources :catalog_media, only: :show
  resources :library_media, only: :show

  namespace :admin do
    resources :purchases, only: [:index, :show]
    resources :media, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :update]
  end

  root to: redirect('/stores')

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if ENV_POLICY.allow?('LETTER_OPENER')
end
