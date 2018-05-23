class Destination < ApplicationRecord
  has_many :flights
  has_many :airlines, through: :flights

  validates :city, presence: true, uniqueness: true
end
