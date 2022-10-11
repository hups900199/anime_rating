class Type < ApplicationRecord
  has_many :animes
  has_many :anime_genres
  has_many :genres, through: :anime_genres

  validates :name, presence: true, uniqueness: true
end
