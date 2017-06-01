class SearchController < ApplicationController

  def index
    @search = Search.get_stores(params[:zipcode])
  end
end
