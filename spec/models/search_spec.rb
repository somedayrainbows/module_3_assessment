require 'rails_helper'

describe Search do
  it "returns raw search data" do
    zipcode = "80202"
    service = SearchService.new({zipcode: zipcode})
    raw_results = service.find_stores
    search = Search.new(raw_results)
    binding.pry

    expect(search.total_stores).to eq("16")
    expect(search["stores"].count).to eq(10)

  end
end
