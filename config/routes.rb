Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  devise_scope :user do
    get '/sign_in' => 'users/sessions#new'
    get '/sign_out' => 'users/sessions#destroy', method: :delete
    get '/sign_up' => 'users/registrations#new'
  end

  authenticated :user do
    root to: redirect('home#index'), as: :authenticated_root
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
