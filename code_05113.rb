p a = {"apple" => "fruit", "coffee" => "drink"}
p a.class


p Hash["apple", "fruit","coffee","drink"]


p a = Hash.new
p a["apple"]
p a = Hash.new("NONE")
p a["apple"]

p a = Hash.new{|hash, key| hash[key] = nil}
p a["apple"]
p a = Hash.new{|hash, key| hash[key] = "NONE" }
p a["apple"]

p "05-116"
p a = Hash.new{|hash, key| hash[key] = nil}
p a["apple"]
p a = Hash.new{|hash, key| hash[key] = "NONE"}
p a["apple"]

p "05-117"
p a = Hash.new("NONE")
p a.default
p a["apple"]
p a.default = "Not exists"
p a["apple"]

p "05-118"
a = {"apple" => "fruit", "coffee" => "drink"}
p a["apple"]

p a.keys
p a.values

p "05-118-05122"
a = {1 => "a", 2 => "b", 3 => "c", 4 => "d"}
p a[1]
p a.keys
p a.values
p a.values_at(1, 3)

p a.fetch(5,"NONE")
p a.fetch(5){|key| key % 2 == 0}

p a.select{|key, value| key % 2 == 0}
p a.find_all{|key, value| key % 2 == 0}

p "05-123"
a = {"apple" => "fruit", "coffee" => "drink"}
a["apple"] = "red"
a["orange"] = "orange"
p a
p a.delete("apple")
a.reject{|key, value| value == "orange"}
p a

a.reject!{|key, value| value == "orange"}
p a

p a.replace({"orange" => "fruit", "tea" => "drink"})
p a.shift

p a.merge({"apple" => "red", "coffee" => "drink"})
p a

a.merge!({"apple" => "friut", "coffee" => "drink"})
p "a="
p a
p a.invert

p a.clear

p "05-133" 
a = {"apple" => "fruit", "coffee" => "drink"}

p a.size
p a.empty?


p a.key?("coffee")
p a.has_key?("tea")
p a.include?("orange")
p a.member?("coffee")
p a.has_value?("fruit")
p a.value?("car")


p "05-136"
p a.each{|key, value| puts "#{key} => #{value}\n"}

p a.each_key{|key| puts "#{key}\n"}

p "05-138"
p a
p a.sort
a.to_a 
