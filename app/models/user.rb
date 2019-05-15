class User < ApplicationRecord

  has_many :pets
  has_many :vets, through: :pets
  has_many :reviews
  has_many :reviewed_vets, through: :reviews, source: :vet


  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  has_secure_password  #password validations
end
