class SearchController < ApplicationController

  def index
    @search = Search.get_stores(params[:zipcode])
    @stores = Search.new(@search)
  end
end
