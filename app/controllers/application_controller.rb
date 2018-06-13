class ApplicationController < ActionController::API
  include Respondable

  before_action :authenticate

  def logged_in?
    current_user.present?
  end

  def current_user
    if auth_present?
      user = User.find auth.first["user"]
      if user
        @current_user ||= user
      end
    end
  end

  def authenticate
    respond_with_error :unauthorized unless logged_in?
  end

  private

  def http_authorization
    request.env["HTTP_AUTHORIZATION"]
  end

  def auth_token
    http_authorization.scan(/Bearer(.*)$/).flatten.last.strip
  end

  def auth
    Auth.decode auth_token
  end

  def auth_present?
    !!auth_token
  end
end
