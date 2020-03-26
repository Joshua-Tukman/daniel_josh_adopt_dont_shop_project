require 'rails_helper'

RSpec.describe "delete a shelter", type: :feature do
    describe "as a visitor" do
        it "can see a link to delete the shelter on the show page" do
            
            shelter1 = Shelter.create(name: 'Frank',
                                    address: '123 Street',
                                    city: 'Denver',
                                    state: 'Colorado',
                                    zip: '80220')
            shelter2 = Shelter.create(name: 'Bill',
                                    address: '123 Street',
                                    city: 'Denver',
                                    state: 'Colorado',
                                    zip: '80220')
        
            visit "/shelters/#{shelter1.id}"

            click_on "Remove Shelter"

            expect(current_path).to eq("/shelters") 
            expect(page).to_not have_content("Frank") 
            
        end
    end
end

# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter