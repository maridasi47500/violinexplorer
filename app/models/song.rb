class Song < ApplicationRecord
has_many :recordings
has_many :videos
  def myfile=(uploaded_io)
    myfilename=self.title.parameterize+self.artist.parameterize+"."+uploaded_io.original_filename.split(".")[-1]
    File.open(Rails.root.join('public', 'uploads', myfilename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end
  def myfile2=(uploaded_io)
    myfilename=self.title.parameterize+self.artist.parameterize+"accompaniment."+uploaded_io.original_filename.split(".")[-1]
    File.open(Rails.root.join('public', 'uploads', myfilename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end
  def myfile3=(uploaded_io)
    myfilename=self.title.parameterize+self.artist.parameterize+"partie."+uploaded_io.original_filename.split(".")[-1]
    File.open(Rails.root.join('public', 'uploads', myfilename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end
  def myfile
    self.title.parameterize+self.artist.parameterize+".mp4"
  end
  def myfile3
    self.title.parameterize+self.artist.parameterize+"partie"
  end
  def myfile2
    self.title.parameterize+self.artist.parameterize+"accompaniment"
  end
  def myfilename
    self.title.parameterize+self.artist.parameterize
  end
end
