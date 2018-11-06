class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save
    render json: UserSerializer.new(user), status: 201
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest, :password_confirmation, :zip_code, :phone_number)
  end
end
