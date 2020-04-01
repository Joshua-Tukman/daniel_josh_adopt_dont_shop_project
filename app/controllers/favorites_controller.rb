class FavoritesController < ApplicationController
  def update
    pet = Pet.find(params[:pet_id])
    favorites.add_pet(pet.id)
    session[:favorites] = favorites.contents
    flash[:notice] = "#{pet.name} has been added to your favorites."
    redirect_to "/pets"
  end

  def index
    @acc = favorites.pet_collection
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    favorites.contents.delete(params[:pet_id])
    flash[:notice] = "#{pet.name} has been removed from your Favorites."
    redirect_to "/pets/#{pet.id}"
  end

  def destroy_all
    favorites.contents.clear
    redirect_to "/favorites" 
  end
end
