class StationSearchResult

  def initialize(zip)
    @zip = zip
  end

  def stations
    data = NRELService.new(@zip).stations_by_zip
    data.map do |station|
      Station.new(station)
    end
  end

end
