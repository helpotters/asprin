Rails.application.routes.draw do
  get 'notifications/destroy'
  get 'notifications/index'
  get 'notifications/feed', to: 'notifications#feed'
  get 'notifications/update'
  resources :posts
  resources :notifications
  devise_for :users, path: '', controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }

  devise_scope :user do
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
      get '/sign_in' => 'users/sessions#new'
      get '/sign_up' => 'users/registrations#new'
    end

    authenticated :user do
      root to: 'home#index', as: :authenticated_root
      get '/sign_out' => 'users/sessions#destroy', method: :delete
      get '/edit_profile' => 'users/profiles#edit', as: :edit_profile
      patch '/update_profile', to: 'users/profiles#update', as: :update_profile
    end
  end
end
