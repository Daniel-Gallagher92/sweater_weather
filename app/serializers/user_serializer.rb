class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :auth_token
end
