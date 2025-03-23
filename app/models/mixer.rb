class Mixer < ApplicationRecord
  has_many :mics
  accepts_nested_attributes_for :mics, allow_destroy: true
  def image=(uploaded_io)
  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  file.write(uploaded_io.read)
end
  write_attribute(:image,uploaded_io.original_filename)
end
  def image
    read_attribute(:image)
  end
end
