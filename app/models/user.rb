class User < ApplicationRecord
  has_many :rates
  has_many :animes, through: :rates

  validates :name, presence: true, uniqueness: true
  validates_length_of :name, minimum: 1, maximum: 50, allow_blank: false
end
