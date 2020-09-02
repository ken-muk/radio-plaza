class Station < ApplicationRecord
  belongs_to :program

  validates :name, presence: true
  validates :broadcast_type, presence: true
end
