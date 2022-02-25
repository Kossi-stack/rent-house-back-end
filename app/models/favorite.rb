class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :house
  validates :user, presence: true
  validates :house, presence: true
end