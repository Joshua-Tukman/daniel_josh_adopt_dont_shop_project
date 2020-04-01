require 'rails_helper'

RSpec.describe "shelter new page", type: :feature do
  describe "as a visitor" do
    it "can see a form to add a new shelter" do

      visit '/shelters'

      click_on "Add A Shelter"

      expect(current_path).to eq("/shelters/new")

      fill_in "name", with: "Daniel"
      fill_in "address", with: "123 Street"
      fill_in "city",	with: "Denver"
      fill_in "state", with: "Colorado"
      fill_in "zip", with: "80220"

      click_on "Add New Shelter"

      expect(current_path).to eq("/shelters") 
      expect(page).to have_content("Daniel")
    end
  end
end
