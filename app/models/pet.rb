class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :vet
  validates :name, :species, presence: true
  validates :name, length: { minimum: 3,
    too_long: "%{count} characters is the minimum allowed" }
  validates :vet_id, presence: true
  validates_associated :vet


  #accepts_nested_attributes_for :vet

   def vet_attributes=(attributes)
      vet = Vet.find_or_create_by(attributes)
      self.vet = vet if vet.valid? || !self.vet
   end

  scope :order_by_age, -> {order(:age)}
  scope :older_animals, -> {where("age > ?",7)}
  scope :dogs, -> {where(species: "Dog")}
  scope :cats, -> {where(species: "Cat")}
  scope :fish, -> {where(species: "Fish")}

  scope :search_by_age, -> (search_age){where("age > ?", search_age)}



end