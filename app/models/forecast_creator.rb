class ForecastCreator
  def initialize(zip)
    @zip = zip
  end

  def today_forecast
    @today_forecast ||= Forecast.new(weather_service.forecast_search[:daily][:data].first)
  end

  private

  def weather_service
    DarkSkyService.new(geocode_service.geocode_search)
  end

  def geocode_service
    GoogleService.new(@zip)
  end
end
