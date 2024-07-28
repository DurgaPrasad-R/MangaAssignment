class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :manga

  validates :rating, presence: true, inclusion: { in: 1..5 }
end
