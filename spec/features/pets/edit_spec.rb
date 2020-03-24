require 'rails_helper'

RSpec.describe "pet update page", type: :feature do
    describe "as a visitor" do
        it "can see a link that takes me to a form to update a pet" do
            
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

            click_on "Update Pet Info"

            expect(current_path).to eq("/pets/#{pet1.id}/edit") 

            fill_in "name",	with: "Hector" 
            # fill_in "image", with: "" 
            fill_in "age",	with: 9 
            fill_in "sex",	with: "male"
            fill_in "description",	with: "banana" 

            click_on "Update Pet"

            expect(current_path).to eq("/pets/#{pet1.id}") 
            # binding.pry
            expect(page).to have_content("Hector") 
            expect(page).to have_content("9") 
            expect(page).to have_content("male") 
            expect(page).to have_content("banana") 
            expect(page).to have_content("Ready for Adoption!") 
        end
    end   
end
