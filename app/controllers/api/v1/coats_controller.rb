class Api::V1::CoatsController < ApplicationController
  def create
    user = User.find_by_api_key(coat_params[:api_key])
    coat = Coat.new(coat_params)
    coat.user_id = user.id
      if coat.save
        render json: CoatSerializer.new(coat), status: 201
      else
        render json: {}, status: 401
      end
  end

  def coat_params
    params.permit(:title, :precip_condition, :high_temp, :low_temp, :api_key)
  end
end
