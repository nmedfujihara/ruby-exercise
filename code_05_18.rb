#Rubyオブジェクトを文字化する
p Marshal.dump({:q => 1, :b => 3, :c => 5})  #=> "\x04\b{\b:\x06qi\x06:\x06bi\b:\x06ci\n"

#２つ目の引数にIOクラスかそのサブクラスを指定すると、そのオブジェクトを対象に直接書き出す
file = File.open("/tmp/marshaldata", "w+")
Marshal.dump({:q => 1, :b => 3, :c => 5}, file)

#文字列化したマーシャルデータからRubyのオブジェクトを復元するにはMarshal.loadを使う
str = Marshal.dump({:q => 1, :b => 3, :c => 5})
p Marshal.load(str)                          #=> {:q=>1, :b=>3, :c=>5}

#Marshal.load の２つ目の引数にIOクラスかふたつ目の引数にIOクラスかそのサブクラスを指定すると、そのオブジェクトから直接復元する
file = File.open("/tmp/marshaldata", "w+")
Marshal.dump({:q => 1, :b => 3, :c => 5}, file)
p file.rewind                                #=> 0
p Marshal.load(file)                         #=> {:q=>1, :b=>3, :c=>5}
