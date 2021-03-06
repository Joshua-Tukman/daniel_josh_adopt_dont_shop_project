require 'rails_helper'

RSpec.describe "Favorites index page" do
  before(:each) do
    @shelter1 = Shelter.create(name: "Poncho's Pointy Pets",
                                address: "555 Indiana Ave",
                                city: "Mexico City",
                                state: "Mexico City",
                                zip: "01049")

    @shelter2 = Shelter.create(name: "Reptiles R Us",
                                address: "7566 Soda Springs Dr",
                                city: "Clearwater Beach",
                                state: "Florida",
                                zip: "33767")
    @shelter3 = Shelter.create(name: "Avian Friends Rescue",
                                address: "9214 Luigia Lane",
                                city: "San Diego",
                                state: "California",
                                zip: "92109")
    @pet1 = @shelter1.pets.create(name: "Alphonso",
                                image: "https://images.freeimages.com/images/large-previews/d1b/white-tailed-porcupine-1364172.jpg",
                                age: 3,
                                sex: "Male",)
    @pet2 = @shelter2.pets.create(name: "Craig",
                                image: "https://images.freeimages.com/images/large-previews/6f2/crocodile-1404500.jpg",
                                age: 48,
                                sex: "Male")
    @pet3 = @shelter3.pets.create(name: "Sharon",
                                image: "https://images.freeimages.com/images/large-previews/161/bird-1383764.jpg",
                                age: 7,
                                sex: "Female")
  end

  it "can show all pets that user has favorited" do
    visit "/pets/#{@pet1.id}"
    click_button "Add Pet to Favorites"
    visit "/pets/#{@pet2.id}"
    click_button "Add Pet to Favorites"

    visit "/favorites"
    expect(page).to have_content("#{@pet1.name}")
    expect(page).to have_css("img[src*='#{@pet1.image}']")
  end

  it "can take me to the favorites index page when I click the favorite button on any page" do

    visit "/pets/#{@pet1.id}"
    click_button "Add Pet to Favorites"

    visit "/shelters"

    click_button "Favorites: 1"

    expect(current_path).to eq("/favorites")
  end

  it "can tell user that they have no favorites when they have not yet favorited a pet" do

    visit "/pets/#{@pet1.id}"
    click_button "Add Pet to Favorites"
    visit "/pets/#{@pet2.id}"
    click_button "Add Pet to Favorites"

    visit "/favorites"
    expect(page).to have_content(@pet1.name)
    expect(page).to have_button("Remove all Favorited Pets")
    click_button "Remove all Favorited Pets"
    expect(page).to have_content("You have no favorited pets.")
    expect(page).to_not have_content(@pet1.name)
  end
end
