require 'yaml'

#YAML_loadメソッドによるYAMLデータの読み込み
yaml_data = <<-DATA
- Red
- Green
- Brue
---
- Yellow
- Pink
- White
DATA
p YAML.load(yaml_data)        #=> ["Red", "Green", "Brue"] 

#YAML.load_fileメソッドによるYAMLデータの読み込み
p YAML.load_file "sample.yml" #=> ["Red", "Green", "Brue"] 

#YAML.load_streamメソッドによるYAMLデータの読み込み
yaml_stream = YAML.load_stream(File.open "sample.yml")
p yaml_stream                 #=>  [["Red", "Green", "Brue"], ["Yellow", "Pink", "White"], {"countory"=>"japan", "state"=>"Tokyo"}]


#YAML.load_documentsメソッドによるYAMLデータの取り込みと処理
#yaml.load_documents(File.open "sample.yml") do |yaml|
#  p yaml.first
#end

#YAML.dumpメソッドによるYAMLデータの書き出し
#引数ioを省略したとき
colors = ["Red", "Green", "Blue"]
YAML.dump colors #=>

#引数ioを指定した場合(ファイル出力のため書き込み処理でオープン)
File.open("sample2.yml", "w+") do |f|
  YAML.dump(colors, f)
end

#YAML.dump_streamメソッドによるYAMLデータの書き出し
colors1 = ["Red", "Green", "Blue"]
colors2 = ["Yellow", "Pink", "White"]
p YAML.dump_stream colors1, colors2  #=> "---\n- Red\n- Green\n- Blue\n---\n- Yellow\n- Pink\n- White\n"


