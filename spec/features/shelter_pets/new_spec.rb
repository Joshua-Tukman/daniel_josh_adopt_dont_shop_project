require 'rails_helper'

RSpec.describe "shelter pet new page", type: :feature do
    describe "as a visitor" do
        it "can see a form to create a new adoptable pet" do 

            shelter1 = Shelter.create(name: "Poncho's Pointy Pets",
                                        address: "555 Indiana Ave",
                                        city: "Mexico City",
                                        state: "Mexico City",
                                        zip: "01049") 
            pet1 = shelter1.pets.create(name: "Alphonso",
                                        image: "https://images.freeimages.com/images/large-previews/d1b/white-tailed-porcupine-1364172.jpg",
                                        age: 3,
                                        sex: "Male",
                                        status: false)  
            
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
            # expect(page).to have_content("example text") 
            expect(page).to have_content("10") 
            expect(page).to have_content("female") 
            # expect(page).to have_content("Ready for Adoption!") 
        end
    end  
end


# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed