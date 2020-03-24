require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
    describe "as a visitor" do
        it "can see all pets and their info" do
            
            shelter1 = Shelter.create(name: "Poncho's Pointy Pets",
                                        address: "555 Indiana Ave",
                                        city: "Mexico City",
                                        state: "Mexico City",
                                        zip: "01049")
    
            shelter2 = Shelter.create(name: "Reptiles R Us",
                                        address: "7566 Soda Springs Dr",
                                        city: "Clearwater Beach",
                                        state: "Florida",
                                        zip: "33767")
            shelter3 = Shelter.create(name: "Avian Friends Rescue",
                                        address: "9214 Luigia Lane",
                                        city: "San Diego",
                                        state: "California",
                                        zip: "92109")
            pet1 = shelter1.pets.create(name: "Alphonso",
                                        image: "https://images.freeimages.com/images/large-previews/d1b/white-tailed-porcupine-1364172.jpg",
                                        age: 3,
                                        sex: "Male",)
            pet2 = shelter2.pets.create(name: "Craig",
                                        image: "https://images.freeimages.com/images/large-previews/6f2/crocodile-1404500.jpg",
                                        age: 48,
                                        sex: "Male")
            pet3 = shelter3.pets.create(name: "Sharon",
                                        image: "https://images.freeimages.com/images/large-previews/161/bird-1383764.jpg",
                                        age: 7,
                                        sex: "Female")

            visit "/pets"
            
            expect(page).to have_content(pet1.name) 
            expect(page).to have_content(pet2.sex) 
            expect(page).to have_content(pet1.age)
            expect(page).to have_content(shelter1.name)
        end
    end
end

# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located