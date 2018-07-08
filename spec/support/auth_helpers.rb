module AuthHelpers
  def signed_in_headers
    user = build :user
    user_instance = User.find_by_username(user.username)
    user_instance ||= create :user
    jwt = Auth.issue user: user_instance.id
    {
      'HTTP_AUTHORIZATION' => 'Bearer ' << jwt
    }.merge(REQUEST_HEADERS)
  end
end
