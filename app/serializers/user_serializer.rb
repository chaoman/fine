# Serializer for +User+ model
class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email

  attribute :followers_count do |object|
    object.followers.count
  end

  attribute :following_count do |object|
    object.following.count
  end

  attribute :auth_token do |object, params|
    current_user = params.dig(:options, :current_user)
    object.auth_token if current_user
  end
end
