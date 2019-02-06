class NRELService

  def initialize(zip)
    @zip = zip
  end

  def stations_by_zip
    retrieve_json("/api/alt-fuel-stations/v1/nearest.json")
  end

  def retrieve_json(destination_uri)
    response = connection.get do |req|
      req.url "#{destination_uri}"
      req.params['location'] = @zip
      req.params['api_key'] = ENV['nrel_api_key']
    end
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations].take(10)
  end

  def connection
    Faraday.new(url: "https://developer.nrel.gov/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
