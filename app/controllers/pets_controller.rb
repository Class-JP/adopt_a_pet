class PetsController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])

    render json: @owner.pets
  end

  def show


  end
end