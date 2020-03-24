require 'rails_helper'

RSpec. describe "shelter pet index page", type: :feature do
    describe "as a visitor" do
    
        it "can see each that can be adopted from shelter with their info" do

            shelter1 = Shelter.create(name: "Poncho's Pointy Pets",
                                        address: "555 Indiana Ave",
                                        city: "Mexico City",
                                        state: "Mexico City",
                                        zip: "01049") 
            pet1 = shelter1.pets.create(name: "Alphonso",
                                        image: "https://images.freeimages.com/images/large-previews/d1b/white-tailed-porcupine-1364172.jpg",
                                        age: 3,
                                        sex: "Male",)
            pet2 = shelter1.pets.create(name: "Craig",
                                        image: "https://images.freeimages.com/images/large-previews/6f2/crocodile-1404500.jpg",
                                        age: 48,
                                        sex: "Male")  
            
            visit "/shelters/#{shelter1.id}"

            click_on "View Pets"

            expect(current_path).to eq("/shelters/#{shelter1.id}/pets") 
            expect(page).to have_content(pet1.name) 
            expect(page).to have_content(pet2.name) 
            expect(page).to have_content(pet1.age) 
            expect(page).to have_content(pet2.age) 
            expect(page).to have_content(pet1.sex) 
            expect(page).to have_content(pet2.sex)
        end
    end
    
end




# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex