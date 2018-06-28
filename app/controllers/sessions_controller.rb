# Controller for +User+ session management
class SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    user = User.find_by_email auth_params[:email]
    respond_with_error(:bad_request, t('errors.no_user')) && return unless user
    if user&.authenticate auth_params[:password]
      jwt = Auth.issue user: user.id
      render json: { access_token: jwt }
    else
      respond_with_error :bad_request
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
