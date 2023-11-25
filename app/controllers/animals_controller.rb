class AnimalsController < ApplicationController
  before_action :set_animal_list, only: [:new, :create]

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
  end

  # /animals -> POST
  def create
    @animal = Animal.new(animals_params)

    if @animal.save
      # EL bicho se guardo...
      flash[:notice] = 'Animal has been created!'

      redirect_to @animal # esto redirige al show... /animals/EL ID DEL ANIMAL NUEVO
    else
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

  def set_animal_list
    @species = Animal::SPECIES_LIST
  end
end
