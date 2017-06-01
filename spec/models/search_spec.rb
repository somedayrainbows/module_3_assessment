require 'rails_helper'

describe Search do
  it "returns raw search data" do
    zipcode = "80202"
    # service = SearchService.new({zipcode: zipcode})
    # raw_results = service.find_stores
    search = Search.get_stores({zipcode: zipcode})
    # stores = Search.new(search)

    binding.pry

  end
end
