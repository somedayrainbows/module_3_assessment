require 'rails_helper'

RSpec.feature "users can search nearby stores by zip" do
  scenario "as a user i can enter a zip and return closest stores" do
    VCR.use_cassette('search_feature', record: :new_episodes) do
      visit root_path

      fill_in :zipcode, with: "80202"
      click_on "Search"

      expect(current_path).to eq(search_path)
      save_and_open_page

      within(".search_results") do
        expect(page).to have_content("16 total stores")
        expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
        expect(page).to have_content("City: DENVER")
        expect(page).to have_content("Store type: Mobile SAS")
        expect(page).to have_content("Store phone: 303-270-9189")
        expect(page).to have_content("This store is 3.45 miles away from the zipcode you entered.")
      end
    end
  end
end

# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
