class AnimeGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :anime
end
