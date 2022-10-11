class Type < ApplicationRecord
  has_many :animes

  validates :name, presence: true, uniqueness: true
end
