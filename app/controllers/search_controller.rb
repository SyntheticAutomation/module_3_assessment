class SearchController < ApplicationController
  def index
    @search = StationSearchResult.new(params[:zip_code])
  end
end
