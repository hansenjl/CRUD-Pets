class VetsController < ApplicationController

  def index
    @vets = Vet.all.includes(:ordered_pets, :users, :dogs, :cats, :fish)
  end

  def show
    @vet = Vet.find_by(id: params[:id])
  end
end


#12933ms (Views: 12135.3ms | ActiveRecord: 534.4ms)
#11934ms (Views: 10622.9ms | ActiveRecord: 576.4ms)
#11177ms (Views: 10100.5ms | ActiveRecord: 430.2ms)
#12089ms (Views: 10941.4ms | ActiveRecord: 265.9ms)

#index