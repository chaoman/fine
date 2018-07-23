# Controller for +User+ model
class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  expose :user

  def me
    user_serialized = current_user.serialized_json(current_user: true)
    render json: user_serialized
  end

  def create
    if user.save
      render json: user.serialized_json
    else
      respond_with_error(:bad_request, user.errors)
    end
  end

  def show
    render json: User.find(params[:id]).serialized_json
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
