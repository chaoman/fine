# Main application controller with all the necessary before actions and methods for auth.
class ApplicationController < ActionController::API
  include ActionController::Helpers
  include Respondable

  before_action :authenticate

  def logged_in?
    current_user.present?
  end

  def current_user
    return unless auth_present?
    user = User.find auth.first['user']
    @current_user ||= user if user
  end

  def authenticate
    respond_with_error :unauthorized unless logged_in?
  end

  private

  def http_authorization
    request.env['HTTP_AUTHORIZATION']
  end

  def auth_token
    http_authorization.scan(/Bearer(.*)$/).flatten.last.strip
  end

  def auth
    Auth.decode auth_token
  end

  def auth_present?
    auth_token.present?
  end
end
