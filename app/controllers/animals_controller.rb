class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  # /animals/ID
  def show
    @animal = Animal.find(params[:id])
  end

  # /animals/new -> GET
  def new
    @animal = Animal.new

    @species = Animal::SPECIES_LIST
  end

  # /animals -> POST
  def create
    @animal = Animal.new(animals_params)

    if @animal.save
      # EL bicho se guardo...
      flash[:notice] = 'Animal has been created!'

      redirect_to @animal # esto redirige al show... /animals/EL ID DEL ANIMAL NUEVO
    else
      @species = Animal::SPECIES_LIST
      # binding.pry
      # El bicho se jodio... no se guardo :(
      flash[:error] = 'Error! Cannot create the animal!'

      render :new, status: 422
    end
  end


  private

  def animals_params
    params.require(:animal).permit(:age, :color, :weight, :species)
  end
end
