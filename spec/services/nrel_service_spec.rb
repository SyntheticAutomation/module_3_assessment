require 'rails_helper'

describe 'NRELService' do
  describe 'stations' do
    it 'searches for stations' do
      VCR.use_cassette("services/find_stations") do
        stations = NRELService.new(80203).find_stations_by_zip
        station_1 = stations.first

        expect(stations.count).to eq(10)
        expect(station_1.name).to eq("UDR")
        expect(station_1.address).to eq("800 Acoma St")
        expect(station_1.fuel_type).to eq("ELEC")
        expect(station_1.distance).to eq(0.31)
        expect(station_1.access_times).to eq("24 hours daily")
      end
    end
  end
end
