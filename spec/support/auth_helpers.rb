module AuthHelpers
  def jwt_bearer
    user = build :user
    user_instance = User.find_by_username(user.username)
    user_instance ||= create :user
    'Bearer ' << (Auth.issue user: user_instance.id)
  end

  def signed_in_headers
    {
      'HTTP_AUTHORIZATION' => jwt_bearer
    }.merge(REQUEST_HEADERS)
  end
end
