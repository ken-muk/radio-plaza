class Personality < ApplicationRecord
  belongs_to :program

  validates :name, presence: true
  validates :occupation, presence: true
end
