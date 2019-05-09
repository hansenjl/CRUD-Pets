class VetsController < ApplicationController

  def index
    @vets = Vet.all
  end

  def show
    @vet = Vet.find_by(id: params[:id])
  end
end
