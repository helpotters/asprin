OmniAuth.config.test_mode = true

def mock_oauth_provider(provider)
  OmniAuth.config.mock_auth[provider.to_sym] = OmniAuth::AuthHash.new(
    provider: provider.to_s,
    uid: '123',
    info: {
      email: 'user@example.com',
      name: 'billy mays',
      image: 'http://github.com/fake-avatar'
    }
  )
end
