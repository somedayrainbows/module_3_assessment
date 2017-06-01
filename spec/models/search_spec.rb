require 'rails_helper'

describe Search do
  it "returns raw search data" do
    raw_results = SearchService.new({zipcode: zipcode})
    search = Search.new(raw_results)

    expect(search).to be_a(Hash)
    expect(search.total_stores).to eq("16")
    expect(search.stores)
  end
end
