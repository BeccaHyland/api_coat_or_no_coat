class Api::V1::CoatsController < ApplicationController
  def index
    if current_user
      render json: CoatSerializer.new(user_coats)
    else
      render json: {}, status: 401
    end
  end

  def create
    if request_params[:api_key] && confirmed_user_by_key
      user = confirmed_user_by_key
      coat = Coat.new(coat_params)
      coat.user_id = user.id
        if coat.save
          render json: CoatSerializer.new(coat), status: 201
        else
          render json: {}, status: 401
        end
    else
      render json: {}, status: 401
    end
  end

  private

  def user_coats
    Coat.where(user_id: current_user[:id])
  end

  def confirmed_user_by_key
    User.find_by_api_key(request_params[:api_key])
  end

  def coat_params
    params.permit(:title, :precip_condition, :high_temp, :low_temp)
  end

  def request_params
    params.permit(:api_key)
  end
end
