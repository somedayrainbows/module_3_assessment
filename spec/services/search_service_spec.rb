require 'rails_helper'

describe SearchService do
  it "can return raw search data" do
    VCR.use_cassette("searchservice") do
      zipcode = "80202"
      search = SearchService.new( {zipcode: zipcode} )
      raw_results = search.find_stores

      expect(raw_results).to be_a(Hash)
    end
  end
end
