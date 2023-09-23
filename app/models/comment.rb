class Comment < ApplicationRecord
  belongs_to :song
  def image=(uploaded_io)
myfilename=(0...8).map { (65 + rand(26)).chr }.join
File.open(Rails.root.join('public', 'uploads', myfilename+".png"), 'wb') do |file|
  file.write(uploaded_io.read)
end
write_attribute(:image,myfilename+".png")

end
def image
read_attribute(:image)
end

end
