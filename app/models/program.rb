class Program < ApplicationRecord
  has_many :corners
  has_one :station
end
