class Vet < ApplicationRecord
  has_many :pets
  has_many :users, through: :pets

  validate :duplicate
  validates :name, :location, :specialty, presence: true


  def self.most_pets
      joins(:pets).group(:id).order('COUNT(pets.id) DESC').limit(3)
  end

  def duplicate
    if Vet.find_by(name: name, location: location)
      errors.add(:name, "This Vet has already been created")
    end
  end

end
