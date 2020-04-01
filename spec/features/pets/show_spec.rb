require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  describe "as a visitor" do
    before(:each) do

      @shelter1 = Shelter.create(name: "Poncho's Pointy Pets",
                                  address: "555 Indiana Ave",
                                  city: "Mexico City",
                                  state: "Mexico City",
                                  zip: "01049")

      @pet1 = @shelter1.pets.create(name: "Alphonso",
                                  image: "https://images.freeimages.com/images/large-previews/d1b/white-tailed-porcupine-1364172.jpg",
                                  age: 3,
                                  sex: "Male",
                                  status: false)

    end

    it "can see that pet and it's info" do

      visit "/pets/#{@pet1.id}"

      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.age)
      expect(page).to have_content(@pet1.sex)
      expect(page).to have_content("Pending Adoption")
    end

    it "can only favorite a pet once. Favorite button will no longer appear on pet show page" do

      visit "/pets/#{@pet1.id}"

      click_button "Add Pet to Favorites"

      visit "/pets/#{@pet1.id}"

      expect(page).to_not have_button("Add Pet to Favorites")
      expect(page).to have_button("Remove pet from Favorites")
      click_button "Remove pet from Favorites"
      expect(current_path).to eq("/pets/#{@pet1.id}")
      expect(page).to have_content("#{@pet1.name} has been removed from your Favorites.")
    end
  end
end
