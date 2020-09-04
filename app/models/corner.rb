class Corner < ApplicationRecord
  belongs_to :program
  has_many :songs

  validates :name, presence: true
  validates :content, presence: true
end
