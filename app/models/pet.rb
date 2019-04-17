class Pet < ApplicationRecord
  validates :name, :species, presence: true

end