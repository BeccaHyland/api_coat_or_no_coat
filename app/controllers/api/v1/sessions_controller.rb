class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: {}, status: 400, message: "Oops, something went wrong. Please try again"
    end
  end

end
