class PetsController < ApplicationController
  def index
    if params[:owner_id].present?
      @owner = Owner.find(params[:owner_id])
    else
      @pets = Pet.all
    end
  end

  def show

  end
end