class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    user = User.new user_params
    if user.save
      render json: UserSerializer.new(user).serialized_json
    else
      respond_with_error :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
