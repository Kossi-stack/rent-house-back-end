class House < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reservations, dependent: :destroy
  validates :name, presence: true
end
