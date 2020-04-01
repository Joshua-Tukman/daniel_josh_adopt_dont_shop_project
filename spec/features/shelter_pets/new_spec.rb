require 'rails_helper'

RSpec.describe "shelter pet new page", type: :feature do
  describe "as a visitor" do
    it "can see a form to create a new adoptable pet" do

      shelter1 = Shelter.create(name: "Poncho's Pointy Pets",
                                  address: "555 Indiana Ave",
                                  city: "Mexico City",
                                  state: "Mexico City",
                                  zip: "01049")

      visit "/shelters/#{shelter1.id}/pets"

      click_on "Add New Pet"

      expect(current_path).to eq("/shelters/#{shelter1.id}/pets/new")

      fill_in "name",	with: "Bongo"
      fill_in "image",	with: "https://images.freeimages.com/images/large-previews/321/water-drop-1386547.jpg"
      fill_in "description",	with: "example text"
      fill_in "age",	with: "10"
      fill_in "sex",	with: "female"

      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{shelter1.id}/pets")
      expect(page).to have_content("Bongo")
      expect(page).to have_content("10")
      expect(page).to have_content("female")

    end
  end
end
