class House < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :name, presence: true
end
