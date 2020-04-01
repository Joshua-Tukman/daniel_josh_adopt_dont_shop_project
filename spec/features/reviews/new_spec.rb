require "rails_helper"

RSpec.describe "shelter review new page", type: :feature do
  describe "as a visitor" do
    before(:each) do

      @shelter1 = Shelter.create(name: "Poncho's Pointy Pets",
                                address: "555 Indiana Ave",
                                city: "Mexico City",
                                state: "Mexico City",
                                zip: "01049")
    end

    it "can see a form to create a new review" do

      visit "/shelters/#{@shelter1.id}"

      click_button "Add New Review"

      expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews/new")

      fill_in "title",	with: "Bongo"
      fill_in "rating",	with: 7
      fill_in "content",	with: "example text"
      fill_in "image",	with: ""

      click_on "Create Review"

      expect(current_path).to eq("/shelters/#{@shelter1.id}")
      expect(page).to have_content("Bongo")
      expect(page).to have_content(7)
      expect(page).to have_content("example text")
    end

    it "will return error message if missing fields" do

      visit "/shelters/#{@shelter1.id}"

      click_button "Add New Review"

      expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews/new")

      fill_in "title",	with: "Bongo"
      fill_in "content",	with: "example text"
      fill_in "image",	with: ""

      click_on "Create Review"

      expect(page).to have_content("Please fill title, rating and content!")
    end
  end
end
