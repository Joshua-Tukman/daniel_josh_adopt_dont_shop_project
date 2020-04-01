require 'rails_helper'

RSpec.describe "new pet application form" do
    describe "as a visitor" do
        it "can click link to apply for a pet from favorites index page" do
            
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

            visit "/pets/#{pet1.id}"
            click_button "Add Pet to Favorites"
            visit "/pets/#{pet2.id}"
            click_button "Add Pet to Favorites"

            visit "/favorites"

            within "#Pet-#{pet1.id}" do
            # binding.pry
                expect(page).to have_button("Apply to Adopt")
                click_on "Apply to Adopt"
            end

            expect(current_path).to eq("/applications/new") 

            expect(page).to have_content("Alphonso")
            expect(page).to have_content("Craig")

            
            within "#Pet-#{pet1.id}" do
                check 'Apply'
            end

            within "#Pet-#{pet2.id}" do
                check 'Apply'
            end

            fill_in "Name",	with: "Sarah" 
            fill_in "Address",	with: "123 Ash St" 
            fill_in "City",	with: "Denver" 
            fill_in "State", with: "Colorado" 
            fill_in "Zip", with: "80220" 
            fill_in "Phone", with: "3039707200"
            fill_in "Qualifications",	with: "I love animals" 

            click_on "Submit Application"

            expect(current_path).to eq("/favorites") 

            expect(page).to have_content("Your application has been submitted!") 
            expect(page).to_not have_content("Alphonso") 
            expect(page).to_not have_content("Craig") 
        end
    end
end


# When I click that link I'm taken to a new application form
# At the top of the form, I can select from the pets of which I've favorited for which I'd like this application to apply towards (can be more than one)
# When I select one or more pets, and fill in my
# - Name
# - Address
# - City
# - State
# - Zip
# - Phone Number
# - Description of why I'd make a good home for this/these pet(s)
# And I click on a button to submit my application
# I see a flash message indicating my application went through for the pets that were selected
# And I'm taken back to my favorites page where I no longer see the pets for which I just applied listed as favorites