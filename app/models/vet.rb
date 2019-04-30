class Vet < ApplicationRecord
  has_many :pets
  has_many :users, through: :pets


  def self.most_pets
      joins(:pets).group(:id).order('COUNT(pets.id) DESC').limit(3)
  end

end
