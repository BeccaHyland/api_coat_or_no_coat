class Api::V1::Forecasts::SearchController < ApplicationController
  def show
    creator = ForecastCreator.new(search_params)
    forecast = creator.today_forecast
    render json: ForecastSerializer.new(forecast)
  end

  private
  def search_params
    params.permit(:zip_code)
  end
end
