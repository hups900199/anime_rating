class Anime < ApplicationRecord
  has_many :anime_genres
  has_many :genres, through: :anime_genres
  belongs_to :type

  validates :name, presence: true, uniqueness: true
end
