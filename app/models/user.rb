class User < ApplicationRecord
  has_secure_password  #password validations

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
