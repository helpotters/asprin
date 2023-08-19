#!/usr/bin/env ruby

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
  "provider" => "github",
  "uid" => 1,
  "info" => {
    "email" => "user-from-github-omniauth@example.com",
    "first_name" => "Test",
    "last_name" => "Test",
    "name" => "Test User",
    "nickname" => "github",
  },
})

OmniAuth.config.mock_auth[:discord] = OmniAuth::AuthHash.new({
  "provider" => "discord",
  "uid" => 1,
  "info" => {
    "email" => "user-from-discord-omniauth@example.com",
    "name" => "Test User",
    "first_name" => "Test",
    "last_name" => "Test",
    "nickname" => "discord",
  },
})
