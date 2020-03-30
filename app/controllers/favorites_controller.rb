class FavoritesController < ApplicationController
  def update
    pet = Pet.find(params[:pet_id])
    favorites.add_pet(pet.id)
    session[:favorites] = favorites.contents
    flash[:notice] = "#{pet.name} has been added to your favorites."
    redirect_to "/pets"
  end

  def index
    @pets = Pets.all
  end
end