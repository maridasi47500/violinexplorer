class Song < ApplicationRecord
has_many :recordings
has_many :videos
def self.numberrecordings
select("*").select("songs.*, (select count(myfiles.id) from myfiles where songs.id = myfiles.song_id) as nbrec").group("songs.id").order("nbrec desc")
end
def self.page(x)
k=x.to_i
if k == 0
select("*,songs.id as id").offset(0).limit(11)
else
select("*, songs.id as id").offset(k.to_i).limit(10)
end
end
def self.suivant(x)
k=x.to_i
if k == 0 && offset(10).limit(10).length > 0
10
elsif offset(k.to_i + 10).limit(10).length > 0
k.to_i + 10
else
nil
end
end
def self.precedent(x)
k=x.to_i
if k <= 0
nil
elsif k == 10
1
else
(k.to_i - 10)
end
end



  def displayname
    title + " - " + artist
  end
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
