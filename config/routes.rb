Rails.application.routes.draw do
  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

  devise_for :users, path: "", controllers: {
                       omniauth_callbacks: "omniauth_callbacks",
                     }

  devise_scope :user do
    unauthenticated :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
      get "/sign_in" => "users/sessions#new"
      get "/sign_up" => "users/registrations#new"
    end

    authenticated :user do
      root to: "home#index", as: :authenticated_root
      # User
      get "/sign_out" => "users/sessions#destroy", method: :delete
      get "/show_profile/:id" => "users/profiles#show", as: :show_profile
      get "/edit_profile" => "users/profiles#edit", as: :edit_profile
      patch "/update_profile", to: "users/profiles#update", as: :update_profile

      # Resources
      resources :posts
      resources :friend_requests
      resources :friendships

      # User's notification feed
      get "notifications/feed", to: "notifications#feed"

      # Search
      post "search", to: "search#index", as: "search"
      post "search/suggestions", to: "search#suggestions", as: "suggestions"

      # Friend Request Actions
      get "friend_requests/create/:id" => "friend_requests#create", as: "send_friend_request"
      post "friend_requests/update/:id" => "friend_requests#update", as: "accept_friend_request"
      delete "friend_requests/destroy/:id" => "friend_requests#destroy", as: "deny_friend_request"
    end
  end
end
