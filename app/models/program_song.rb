class ProgramSong < ApplicationRecord
  belongs_to :program
  belongs_to :song
end
