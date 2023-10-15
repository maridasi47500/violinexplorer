class Mixer < ApplicationRecord
  has_many :mics
  accepts_nested_attributes_for :mics
end
