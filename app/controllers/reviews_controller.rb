class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    new_review = @shelter.reviews.new(review_params)
      if new_review.save
        redirect_to "/shelters/#{@shelter.id}"
      else
        flash[:notice] = "Please fill title, rating and conent!"
        render :new
      end
  end

  private

  def review_params
    params.permit(:title, :content, :rating, :image)
  end
end
