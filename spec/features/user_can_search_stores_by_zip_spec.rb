require 'rails_helper'

### 2. Consume 3rd party API
# search and return Best Buy locations in our area.
# Display the returned stores and their attributes returned from the API query in a logical and intuitive HTML layout. (This does not need to be styled).

RSpec.feature "users can search nearby stores by zip" do
  scenario "as a user i can enter a zip and return closest stores" do
    VCR.use_cassette('search', record: :new_episodes) do
      visit root_path

      fill_in :zipcode, with: "80202"
      click_on "Search"

      expect(current_path).to eq(search_path)

      within(".search_results") do
        expect(page).to have_content("16 total stores")

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
