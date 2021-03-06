require "rails_helper"

RSpec.describe "pet's show page" do
  describe "as a visitor" do
    it "can add pet to favorites" do

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

      pet2 = shelter1.pets.create(name: "Craig",
                                  image: "https://images.freeimages.com/images/large-previews/6f2/crocodile-1404500.jpg",
                                  age: 48,
                                  sex: "Male",
                                  status: true,
                                  description: "May eat your children...")

    visit "/pets/#{pet1.id}"

      expect(page).to have_content(pet1.name)

      click_button "Add Pet to Favorites"
      expect(page).to have_content("#{pet1.name} has been added to your favorites.")

      expect(page).to have_button("Favorites: 1")

      visit "/pets/#{pet2.id}"
      click_button "Add Pet to Favorites"

      expect(page).to have_button("Favorites: 2")

    end
  end
end
