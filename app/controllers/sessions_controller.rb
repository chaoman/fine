# Controller for +User+ session management
class SessionsController < ApplicationController
  skip_before_action :authenticate

  expose :user, -> { User.find_by_email user_params[:email] }

  def create
    respond_with_error(:bad_request, t('errors.no_user')) && return unless user
    if user&.authenticate user_params[:password]
      jwt = user.auth_token
      render json: { access_token: jwt }
    else
      respond_with_error :bad_request
    end
  end

  private

  def user_params
    params.require(:auth).permit(:email, :password)
  end
end
