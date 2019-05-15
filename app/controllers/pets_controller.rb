class PetsController < ApplicationController
  before_action :check_for_logged_in, except: [:index]

  def new
    #check if it's nested & it's a proper id
    if params[:vet_id] && vet = Vet.find_by_id(params[:vet_id])
      #nested route
      @pet = vet.pets.build #has_many
    else
      #unnested
      @pet = Pet.new
      @pet.build_vet  #belongs_to
    end
  end


  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      @pet.build_vet unless @pet.vet
      render :new
    end
  end

  def index
    if params[:vet_id] && vet = Vet.find_by_id(params[:vet_id])
      #nested route
      @pets = vet.pets
    else
       if params[:age]
          @pets = Pet.search_by_age(params[:age]).order_by_age
          @pets = Pet.order_by_age if @pets == []
        else
          @pets = Pet.order_by_age
        end
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
    if @pet.update(pet_params)
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

  def pet_params
    params.require(:pet).permit(:age, :name, :species, :vet_id, vet_attributes: [:name, :location, :specialty])
  end
end