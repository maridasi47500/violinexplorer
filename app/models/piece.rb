class Piece < ApplicationRecord
def self.tempo(x,asc)
if x == "1"
order(:tempo => asc)
else 
all
end
end
def self.mydate(x,asc)
if x == "1"
order(:date => asc)
else 
all
end
end
def self.mylength(x,asc)
if x =="1"
order(:length => asc)
else 
all
end
end
end
