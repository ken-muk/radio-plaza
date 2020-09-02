class Song < ApplicationRecord
  belongs_to :corner, optional: true
  has_many :program_songs, dependent: :destroy
  has_many :programs, dependent: :destroy, through: :program_songs

  validates :title, presence: true
  validates :artist, presence: true
  validates :song_type, presence: true
end
