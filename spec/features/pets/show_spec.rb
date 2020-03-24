require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
    describe "as a visitor" do
        it "can see that pets and its info" do
            
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

            visit "/pets/#{pet1.id}"

            expect(page).to have_content(pet1.name) 
            expect(page).to have_content(pet1.age) 
            expect(page).to have_content(pet1.sex) 
            expect(page).to have_content("Pending Adoption") 
        end
    end
end


# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status