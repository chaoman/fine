# Controller for +User+ session management
class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  expose :user, -> { User.find_by_email user_params[:email] }

  def create
    respond_with_error(:bad_request, t('errors.no_user')) && return unless user
    if user&.authenticate user_params[:password]
      user_serialized = user.serialized_json(current_user: true)
      render json: user_serialized
    else
      respond_with_error(:bad_request, t('errors.invalid_email_or_password'))
    end
  end

  private

  def user_params
    params.require(:auth).permit(:email, :password)
  end
end
