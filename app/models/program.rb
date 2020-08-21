class Program < ApplicationRecord
  has_many :personalities
  has_many :corners
  has_one :station
end
