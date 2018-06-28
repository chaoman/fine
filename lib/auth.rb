require 'jwt'

# Provides a wrapper for JWT gem
class Auth
  ALGORITHM = 'HS256'.freeze

  def self.issue(payload)
    JWT.encode payload, auth_secret, ALGORITHM
  end

  def self.decode(token)
    JWT.decode token, auth_secret, true, algorithm: ALGORITHM
  end

  def self.auth_secret
    Rails.application.credentials.secret_key_base
  end
end
