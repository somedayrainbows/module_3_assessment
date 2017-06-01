class SearchController < ApplicationController

  def index
    @search = Search.find_stores(params[:zipcode])
  end
end
