require 'rails_helper'

RSpec.describe "shelter update page", type: :feature do
  describe "as a visitor" do
    it "can see a link thats take me to form to update a shelter" do

      shelter1 = Shelter.create(name: 'Daniel',
                              address: '123 Street',
                              city: 'Denver',
                              state: 'Colorado',
                              zip: '80220')

      visit "/shelters/#{shelter1.id}"

      click_on "Edit Shelter"

      expect(current_path).to eq("/shelters/#{shelter1.id}/edit")

      fill_in "name", with: "Bob"
      fill_in "address", with: "555 Avenue"
      fill_in "city",	with: "Phoenix"
      fill_in "state", with: "Arizona"
      fill_in "zip", with: "85048"

      click_on "Update Shelter Information"

      expect(current_path).to eq("/shelters/#{shelter1.id}")

      expect(page).to have_content("Bob")
      expect(page).to have_content("555 Avenue")
      expect(page).to have_content("Phoenix")
      expect(page).to have_content("Arizona")
      expect(page).to have_content("85048")
    end
  end
end
