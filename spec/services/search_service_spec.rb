require 'rails_helper'

describe SearchService do
  it "can return raw search data" do
    VCR.use_cassette('search_service', record: :new_episodes) do
      zipcode = "73019"
      search = SearchService.new(zipcode)
      raw_results = search.find_stores

      expect(raw_results).to be_a(Hash)
      expect(raw_results[:stores].count).to eq(7)
      expect(raw_results[:total]).to eq(7)
    end
  end
end
