class Anime < ApplicationRecord
  default_per_page

  has_many :anime_genres
  has_many :genres, through: :anime_genres

  has_many :rates
  has_many :users, through: :rates

  belongs_to :type

  validates :name, presence: true, uniqueness: true
  validates_length_of :name, minimum: 1, maximum: 70, allow_blank: false
end
