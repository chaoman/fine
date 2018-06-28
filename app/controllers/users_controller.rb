# Controller for +User+ model
class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    user = User.new user_params
    if user.save
      user_serialized = UserSerializer.new user
      render json: user_serialized.serialized_json
    else
      respond_with_error(:bad_request, user.errors)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
