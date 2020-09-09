class Program < ApplicationRecord
  has_many :personalities
  has_many :corners
  has_many :program_songs, dependent: :destroy
  has_many :songs, through: :program_songs
  has_one :station

  validates :name, presence: true
  validates :day, presence: true
  validates :start_year, presence: true
  validates :end_year, presence: true
  validates :ongoing, presence: true
end
