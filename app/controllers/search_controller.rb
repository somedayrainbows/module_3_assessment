class SearchController < ApplicationController

  def index
    @stores = Search.new(params.symbolize_keys[:zipcode])
  end
end
