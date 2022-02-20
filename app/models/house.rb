class House < ApplicationRecord 
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
end
