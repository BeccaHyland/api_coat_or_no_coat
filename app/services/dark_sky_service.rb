class DarkSkyService
  def initialize( filter = {} )
    #for US 1 this filter will take in a lat/lng hash
    @filter = filter
  end

  def forecast_search
    json = get_json("/forecast/#{ENV["dark_ski_api_key"]}/#{stringify_coordinates}?exclude=currently,minutely,daily")
  end

  def stringify_coordinates
    @filter.values.join(",")
  end

  private

  def conn
    Faraday.new(url: "https://api.darksky.net")
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
