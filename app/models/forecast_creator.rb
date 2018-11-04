class ForecastCreator
  def initialize(zip)
    @zip = zip
  end

  def today_forecast
    @forecast_object ||= Forecast.new(weather_service.forecast_search[:hourly])
  end

  private

  def weather_service
    DarkSkyService.new(geocode_service.geocode_search)
  end

  def geocode_service
    GoogleService.new(@zip)
  end
end
