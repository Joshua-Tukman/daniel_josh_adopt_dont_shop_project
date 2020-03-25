require 'rails_helper'

RSpec.describe "shelter show page" do
    describe "as a visitor" do
        it "can see a list of shelter reviews" do

            shelter1 = Shelter.create!(name: "Poncho's Pointy Pets",
                                        address: "555 Indiana Ave",
                                        city: "Mexico City",
                                        state: "Mexico City",
                                        zip: "01049")
            review1 = shelter1.reviews.create!(title: "Great Place",
                                            rating: 9,
                                            content: "Very friendly staff",
                                            image: "https://images.freeimages.com/images/large-previews/5ae/grape-vine-leaf-1327453.jpg")
            review2 = shelter1.reviews.create!(title: "Just ok",
                                            rating: 4,
                                            content: "Ugly pets",
                                            image: "https://images.freeimages.com/images/large-previews/3a2/hyena-1386682.jpg")

            visit "/shelters/#{shelter1.id}"

            within "#review-#{review1.id}" do

                expect(page).to have_content(review1.title)
                expect(page).to have_content(review1.rating)
                expect(page).to have_content(review1.content)
                expect(page).to have_css("img[src*='https://images.freeimages.com/images/large-previews/5ae/grape-vine-leaf-1327453.jpg']")
            end

            within "#review-#{review2.id}" do

                expect(review2.title).to eq("Just ok")
                expect(page).to have_content(review2.rating)
                expect(review2.content).to eq("Ugly pets")
                expect(page).to have_css("img[src*='https://images.freeimages.com/images/large-previews/3a2/hyena-1386682.jpg']")


            end
        end
    end
end



# As a visitor,
# When I visit a shelter's show page,
# I see a list of reviews for that shelter
# Each review will have:
# - title
# - rating
# - content
# - an optional picture
