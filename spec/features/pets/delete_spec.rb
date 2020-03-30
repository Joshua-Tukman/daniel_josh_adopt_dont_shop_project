require 'rails_helper'

RSpec.describe "delete a pet" do
    describe "as a visitor" do
        it "can see a link that deletes a pet" do

            shelter1 = Shelter.create(name: 'Daniel',
                                    address: '123 Street',
                                    city: 'Denver',
                                    state: 'Colorado',
                                    zip: '80220')
            pet1 = shelter1.pets.create(name: "Alphonso",
                                    image: "https://images.freeimages.com/images/large-previews/d1b/white-tailed-porcupine-1364172.jpg",
                                    age: 3,
                                    sex: "Male",
                                    description: "sample",
                                    status: true)

            visit "/pets/#{pet1.id}"
            
            click_on "Delete Pet"

            expect(current_path).to eq("/pets")
            expect(page).to_not have_content(pet1.name)
        end
    end
end

# As a visitor
# When I visit a pet show page
# Then I see a link to delete the pet "Delete Pet"
# When I click the link
# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page where I no longer see this pet
