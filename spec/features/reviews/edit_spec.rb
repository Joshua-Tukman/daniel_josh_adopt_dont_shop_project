require 'rails_helper'

RSpec.describe "shelter review edit page" do
  describe "as a visitor" do
    it "can see a link that takes me to a form to update a review" do

      shelter1 = Shelter.create(name: 'Daniel',
                              address: '123 Street',
                              city: 'Denver',
                              state: 'Colorado',
                              zip: '80220')

      review1 = shelter1.reviews.create!(title: "Great Place",
                                      rating: 9,
                                      content: "Very friendly staff",
                                      image: "https://images.freeimages.com/images/small-previews/d21/hi-me-1407590.jpg")

      visit "/shelters/#{shelter1.id}"

      within "#review-#{review1.id}" do
        expect(page).to have_button("Update Review")
        click_on "Update Review"
      end

      expect(current_path).to eq("/reviews/#{review1.id}/edit")
      expect(page).to have_field("title", with: "#{review1.title}")
      expect(page).to have_field("rating", with: "#{review1.rating}")
      expect(page).to have_field("content", with: "#{review1.content}")
      expect(page).to have_field("image", with: "#{review1.image}")


      fill_in "title",	with: "Bad Place"
      fill_in "rating",	with: 1
      fill_in "content",	with: "Rude staff"
      fill_in "image",	with: "https://images.freeimages.com/images/large-previews/05e/on-the-road-6-1384796.jpg"

      click_on "Update Review"

      expect(current_path).to eq("/shelters/#{review1.shelter.id}")
      review1.reload

      within "#review-#{review1.id}" do
        expect(review1.title).to eq("Bad Place")
        expect(review1.rating).to eq(1)
        expect(review1.content).to eq("Rude staff")
        expect(page).to have_css("img[src*= 'https://images.freeimages.com/images/large-previews/05e/on-the-road-6-1384796.jpg']")
      end
    end
  end
end
