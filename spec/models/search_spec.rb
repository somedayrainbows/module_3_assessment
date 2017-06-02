require 'rails_helper'

describe Search do
  it "returns raw search data" do
    VCR.use_cassette('search_poro', record: :new_episodes) do
      zipcode = "80211"
      search = Search.new(zipcode)
      search.get_stores
      search.total_stores

      expect(search.get_stores).to be_an(Array)
      expect(search.get_stores.first.name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(search.get_stores.first.city).to eq("DENVER")
      expect(search.get_stores.first.type).to eq("Mobile SAS")
      expect(search.get_stores.first.phone).to eq("303-270-9189")
      expect(search.get_stores.first.distance).to eq(5.04)

      expect(search.total_stores).to eq(16)
    end
  end
end
