class Anime < ApplicationRecord
  paginates_per 10

  has_many :anime_genres
  has_many :genres, through: :anime_genres

  has_many :rates
  has_many :users, through: :rates

  belongs_to :type

  validates :name, presence: true, uniqueness: true
  validates_length_of :name, minimum: 1, maximum: 70, allow_blank: false
end
