class ForecastCreator
  def initialize(zip)
    @zip = zip
  end

  def today_forecast
    @forecast_object ||= Forecast.new(service.forecast_search[:hourly])
  end

end
