class SearchController < ApplicationController
  def index
    @search = StationSearchResult.new(params[:q]) #q is the zip code we pass in.
  end
end
