class Review < ApplicationRecord
  validates :rating, :conent, presence: true
  validates :rating, numericality: { less_than_or_equal_to: 10, greater_than: 0,  only_integer: true }

  belongs_to :vet
  belongs_to :reviewer, class_name: "User"


end
