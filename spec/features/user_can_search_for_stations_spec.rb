require 'rails_helper'

describe 'A user of our web app' do
  it 'can search for stations' do
    visit "/"
    fill_in "q", with: 80203
    click_on "Locate"
    expect(current_path).to eq(search_path)
    expect(page).to have_content("10 Closest Stations")
    expect(page).to have_css(".station", count: 10)

    within(first(".station")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel-type")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".access-times")
    end

  end

end
