class Recording < Myfile
  belongs_to :song
def self.mypage(x)
k=x.to_i
if k == 0
  select("myfiles.*, songs.title, songs.artist").joins(:song).group("myfiles.id").limit(11).offset(0)
else
  select("myfiles.*, songs.title, songs.artist").joins(:song).group("myfiles.id").limit(10).offset(k.to_i)
end
end
def self.suivant(x)
k=x.to_i
if k == 0 && offset(10).limit(10).length > 0
10
elsif k == 1 && offset(10).limit(10).length > 0
10
elsif offset((k.to_i + 10)).limit(10).length > 0
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
elsif offset((k.to_i - 10)).limit(10).length == 0
nil

else
(k.to_i - 10)
end
end

def self.recent
order(:created_at => :desc).limit(10)
end
end
