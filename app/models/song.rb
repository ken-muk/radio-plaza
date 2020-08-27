class Song < ApplicationRecord
  belongs_to :corner, optional: true
  has_many :program_songs, dependent: :destroy
  has_many :programs, dependent: :destroy, through: :program_songs
end
