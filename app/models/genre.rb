class Genre < ApplicationRecord
  has_many :anime_genres
  has_many :animes, through: :anime_genres

  validates :name, presence: true, uniqueness: true
  validates_length_of :name, minimum: 1, maximum: 50, allow_blank: false
end
