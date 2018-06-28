# Serializer for +User+ model
class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email
end
