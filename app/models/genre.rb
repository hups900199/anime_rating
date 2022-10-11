class Genre < ApplicationRecord
  has_many :anime_genres
  has_many :animes, through: :anime_genres

  validates :name, presence: true, uniqueness: true
end
