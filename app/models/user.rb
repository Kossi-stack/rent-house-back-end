class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :houses, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :email, presence: true
end
