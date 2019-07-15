class Vet < ApplicationRecord
  has_many :pets
  has_many :users, through: :pets
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :reviewer
  has_many :older_pets, -> {older_animals}, class_name: 'Pet'
  validates :name, :location, :specialty, presence: true
  validates_uniqueness_of  :name, scope: :location



  def self.most_pets
      joins(:pets).group(:id).order('COUNT(pets.id) DESC').limit(3)
  end

  def ordered_pets
    pets.order_by_age
  end

  # def older_pets
  #   pets.older_animals
  # end

  def dogs
    pets.where(species: 'Dog')
  end

  def cats
    pets.where(species: 'Cat')
  end

  def fish
    pets.where(species: 'Fish')
  end

  # validate :duplicate
  # def duplicate
  #   if Vet.find_by(name: name, location: location)
  #     errors.add(:name, "This Vet has already been created")
  #   end
  # end

end
