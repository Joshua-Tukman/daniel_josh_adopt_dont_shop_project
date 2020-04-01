class ShelterPetsController < ApplicationController

  def index
      @shelter = Shelter.find(params[:shelter_id])
  end

  def new
      @shelter_id = params[:shelter_id]
  end

  def  create
    shelter = Shelter.find(params[:shelter_id])
    new_pet = shelter.pets.create!(shelter_pet_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  private

  def shelter_pet_params
      params.permit(:name, :image, :age, :sex, :description, :status)
  end
end
