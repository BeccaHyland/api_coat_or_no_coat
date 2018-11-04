class GoogleService
  def initialize(filter)
    @filter = filter
  end

  def geocode_search
    json = get_json("/maps/api/geocode/json?key=#{ENV["google_geocode_api_key"]}&address=#{@filter}")
    json[:results].first[:geometry][:location]
  end

  private

  def conn
    Faraday.new(url: "https://maps.googleapis.com")
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

end
