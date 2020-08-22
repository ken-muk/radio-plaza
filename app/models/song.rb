class Song < ApplicationRecord
  belongs_to :corner, optional: true
end
