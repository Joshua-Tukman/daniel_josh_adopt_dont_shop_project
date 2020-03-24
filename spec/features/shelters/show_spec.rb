require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
    describe "as a visitor" do
        it 'can see all shelter details' do

        shelter1 = Shelter.create(name: "Poncho's Pointy Pets",
                                        address: "555 Indiana Ave",
                                        city: "Mexico City",
                                        state: "Mexico City",
                                        zip: "01049")

        visit "/shelters/#{shelter1.id}"

        expect(page).to have_content(shelter1.name)
        expect(page).to have_content(shelter1.address)
        expect(page).to have_content(shelter1.city)
        expect(page).to have_content(shelter1.state)
        expect(page).to have_content(shelter1.zip)
        end
    end 
end

# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip