Rails.application.routes.draw do
  require 'sidekiq/web'

  devise_for :users

  resources :users do
    member do
      get :edit_profile
      patch :update_profile
    end
  end

  root to: redirect('/users/sign_in')

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
