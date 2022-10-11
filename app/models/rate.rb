class Rate < ApplicationRecord
  belongs_to :anime
  belongs_to :user

  validates :rate, presence: true, :inclusion => { :in => -1..10 }
end
