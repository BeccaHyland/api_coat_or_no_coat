class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: {}, status: 400, message: "Oops, please check that all fields are complete and try again."
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest, :password_confirmation, :zip_code, :phone_number)
  end
end
