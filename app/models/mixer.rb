class Mixer < ApplicationRecord
  belongs_to :song, optional: true
end
