class ApplicationsController < ApplicationController 

    def new
        binding.pry
        @pets = Pet.find(session[:favorites])
    end
    
end