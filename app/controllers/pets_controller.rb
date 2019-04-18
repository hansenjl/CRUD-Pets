class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end


  def create
    @pet = Pet.new(pet_params(:name,:age,:species))

    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def index
    if params[:age]
      @pets = Pet.search_by_age(params[:age]).order_by_age
      @pets = Pet.order_by_age if @pets == []
    else
      @pets = Pet.order_by_age
    end
  end

  def show
    set_pet
  end

  def edit
    set_pet
  end

  def update
    set_pet
    if @pet.update(pet_params(:name,:age))
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  def destroy
    set_pet
    @pet.destroy
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find_by(id: params[:id])
    if !@pet
      redirect_to pets_path
    end
  end

  def pet_params(*args)
    params.require(:pet).permit(*args)
  end
end