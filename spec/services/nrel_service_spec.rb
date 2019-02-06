require 'rails_helper'

describe 'NRELService' do
  describe 'stations' do
    it 'searches for stations' do
      VCR.use_cassette("services/find_stations") do
        stations = NRELService.new(80203).stations_by_zip
        station_1 = stations.first

        expect(stations.count).to eq(10)
        expect(station_1[:station_name]).to eq("UDR")
        expect(station_1[:street_address]).to eq("800 Acoma St")
        expect(station_1[:fuel_type_code]).to eq("ELEC")
        expect(station_1[:distance].round(2)).to eq(0.31)
        expect(station_1[:access_days_time]).to eq("24 hours daily")
      end
    end
  end
end
