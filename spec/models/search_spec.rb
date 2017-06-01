require 'rails_helper'

describe Search do
  it "returns raw search data" do
    zipcode = "80202"
    service = SearchService.new({zipcode: zipcode})
    raw_results = service.find_stores
    search = Search.get_stores(raw_results)
    stores = Search.new(search)

    expect(stores.total_stores).to eq(16)
    binding.pry

  end
end
