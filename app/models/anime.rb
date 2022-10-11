class Anime < ApplicationRecord
  belongs_to :type

  validates :name, presence: true, uniqueness: true
end
