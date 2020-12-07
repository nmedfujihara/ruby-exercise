require 'json'

#文字列からjsonを読み込む
json = <<-DATA
["Red","Green", "Blue"]
DATA

p JSON.load(json)    #=> ["Red", "Green", "Blue"]

#loadメソッドの引数にioオブジェクトを指定することでioオブジェクト経由でデータを読み込む
p JSON.load(File.open("data.json")) #=> {"countory"=>"Japan", "state:"=>"Tokyo"} 

#オブジェクトをJSON文字列に変換する
array = ["Red", "Green", "Blue"]
p JSON.dump(array)   #=> "[\"Red\",\"Green\",\"Blue\"]"

#オブジェクトをJSON形式に変換し、ファイルを出力する
array = ["Red", "Green", "Blue"]
File.open("dump.json", "w") do |f|
  JSON.dump(array,f)
end
 
