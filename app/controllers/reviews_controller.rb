class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end
# binding.pry
  def create
    @shelter = Shelter.find(params[:shelter_id])
    new_review = @shelter.reviews.new(review_params)
      if new_review.save
        redirect_to "/shelters/#{@shelter.id}"
      else
        flash[:notice] = "Please fill title, rating and conent!"
        # redirect_to "/shelters/#{@shelter.id}/reviews/new"
        render :new
      end
  end

  def edit
    # @shelter = Shelter.find(params[:shelter_id])
    @review = Review.find(params[:review_id])
  end

  def update
    # binding.pry
    # @shelter = Shelter.find(params[:shelter_id])
    @review = Review.find(params[:review_id])
    @review.update(review_params)
      if @review.save
        redirect_to "/shelters/#{@review.shelter.id}"
      else
        flash[:notice] = "Please fill title, rating and conent!"
        render :edit
      end
  end
  

  private

  def review_params
    params.permit(:title, :content, :rating, :image)
  end
end

# flash[:notice] = review.errors.full_messages.to_sentence]
