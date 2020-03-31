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

        it "can only favorite a pet once. Favorite button will no longer appear on pet show page" do
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

          click_button "Add Pet to Favorites"

          visit "/pets/#{pet1.id}"

          expect(page).to_not have_button("Add Pet to Favorites")
          expect(page).to have_button("Remove pet from Favorites")
          click_button "Remove pet from Favorites"
          expect(current_path).to eq("/pets/#{pet1.id}")
          expect(page).to have_content("#{pet1.name} has been removed from your Favorites.")

        end
    end

end

# But I see a link to remove that pet from my favorites
# When I click that link
# A delete request is sent to "/favorites/:pet_id"
# And I'm redirected back to that pets show page where I can see a flash message indicating that the pet was removed from my favorites
# And I can now see a link to favorite that pet
# And I also see that my favorites indicator has decremented by 1
#
# # As a visitor
# # When I visit '/pets/:id'
# # Then I see the pet with that id including the pet's:
# # - image
# # - name
# # - description
# # - approximate age
# # - sex
# # - adoptable/pending adoption status
