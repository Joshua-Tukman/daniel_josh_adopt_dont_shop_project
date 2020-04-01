require 'rails_helper'

RSpec.describe "delelte a shelter reveiw" do
  describe "as a visitor" do
    it "can see a link that deletes a review" do

      shelter1 = Shelter.create(name: "Poncho's Pointy Pets",
                      address: "555 Indiana Ave",
                      city: "Mexico City",
                      state: "Mexico City",
                      zip: "01049")
      review1 = shelter1.reviews.create!(title: "Great Place",
                      rating: 9,
                      content: "Very friendly staff",
                      image: "https://images.freeimages.com/images/small-previews/d21/hi-me-1407590.jpg")

      visit "/shelters/#{shelter1.id}"

      within "#review-#{review1.id}" do
          click_on "Delete Review"
      end

      expect(current_path).to eq("/shelters/#{shelter1.id}")
      expect(page).to_not have_content(review1.title)
    end
  end    
end
