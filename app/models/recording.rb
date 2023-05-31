class Recording < Myfile
def self.page(x)
k=x.to_i
if k = 0
offset(1).limit(10)
else
offset(k.to_i).limit(10)
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

def self.recent
order(:created_at => :desc).limit(10)
end
end
