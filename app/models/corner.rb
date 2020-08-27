class Corner < ApplicationRecord
  belongs_to :program
  has_many :songs
end
