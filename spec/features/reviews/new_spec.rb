require "rails_helper"

RSpec.describe "shelter review new page", type: :feature do

    describe "as a visitor" do
      it "can see a form to create a new review" do

    shelter1 = Shelter.create(name: "Poncho's Pointy Pets",
                                address: "555 Indiana Ave",
                                city: "Mexico City",
                                state: "Mexico City",
                                zip: "01049")

    visit "/shelters/#{shelter1.id}"

    click_button "Add New Review"

    expect(current_path).to eq("/shelters/#{shelter1.id}/reviews/new")

    fill_in "title",	with: "Bongo"
    fill_in "rating",	with: 7
    fill_in "content",	with: "example text"
    fill_in "image",	with: ""

    click_on "Create Review"

    expect(current_path).to eq("/shelters/#{shelter1.id}")
    expect(page).to have_content("Bongo")

    end
  end
end

# User Story 3, Shelter Review Creation
#
# As a visitor,
# When I visit a shelter's show page
# I see a link to add a new review for this shelter.
# When I click on this link, I am taken to a new review path
# On this new page, I see a form where I must enter:
# - title
# - rating
# - content
# I also see a field where I can enter an optional image (web address)
# When the form is submitted, I should return to that shelter's show page
# and I can see my new review
