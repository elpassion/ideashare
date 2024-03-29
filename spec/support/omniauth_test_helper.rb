def set_omniauth(opts = {})
  default = {provider: :facebook,
             uuid: '1234',
             facebook: {
                 email: 'foobar@example.com',
                 gender: 'Male',
                 first_name: 'foo',
                 last_name: 'bar'
             }
  }

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = OmniAuth::AuthHash.new(
      {
          uid: credentials[:uuid],
          info: {
              email: user_hash[:email],
              first_name: user_hash[:first_name],
              last_name: user_hash[:last_name],
              gender: user_hash[:gender]
          }
      })
end

def set_invalid_omniauth(opts = {})
  default = {provider: :facebook,
             uuid: '1234',
             facebook: {
                 gender: 'Male',
                 first_name: 'foo',
                 last_name: 'bar'
             }
  }

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = OmniAuth::AuthHash.new(
      {
          uid: credentials[:uuid],
          info: {
              first_name: user_hash[:first_name],
              last_name: user_hash[:last_name],
              gender: user_hash[:gender]
          }
      })


end
