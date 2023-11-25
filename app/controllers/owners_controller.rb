class OwnersController < ApplicationController
  before_action 

  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
    @owner.pets.build # anade una instancia de Pet dentro del arreglo de .pets

    @animals_list = Animal.all.pluck(:species, :id) ## [ [Nombre el Animal, Id del animal],... ]
  end

  def create
    binding.pry # debugger!
    @owner = Owner.new(owner_params)

    if @owner.save
      flash[:notice] = 'Owner has been created!'

      redirect_to owners_path
    else
      flash[:error] = 'Error! Cannot create the owner!'

      render :new, status: 422
    end
  end

  def edit
    @owner = Owner.find(params[:id])
    @animals_list = Animal.all.pluck(:species, :id)
  end

  def update
    @owner = Owner.find(params[:id])

    if @owner.update(owner_params)
      flash[:notice] = "Owner #{@owner.name}, has been updated"

      redirect_to @owner
    else
      flash[:error] = 'Owner cannot be updated'
      render :edit
    end
  end

  def destroy
    @owner = Owner.find(params[:id])

    @owner.delete
  end

  private

  def owner_params
    params.require(:owner).permit(:age, :name, :email, pets_attributes: [:name, :animal_id])
  end

  
end
