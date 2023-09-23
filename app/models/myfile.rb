class Myfile < ApplicationRecord
belongs_to :song
belongs_to :accompaniment, optional: true
def recording=(uploaded_io)
myfilename=(0...8).map { (65 + rand(26)).chr }.join
File.open(Rails.root.join('public', 'uploads', myfilename+".wav"), 'wb') do |file|
  file.write(uploaded_io.read)
end
write_attribute(:filename,myfilename+".wav")

end
def filename
read_attribute(:filename)
end
end
