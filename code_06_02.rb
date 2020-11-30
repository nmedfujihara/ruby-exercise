require 'stringio'

#openメソッドによるStringIOインスタンスの作成
sio = StringIO.open "Hello StringIO."
#ブロックを使用しない場合、sioにStringIOクラスのインスタンスが代入される
p sio        #=> #<StringIO:0x0000000192f918>

#ブロックを使用する場合、ブロック内の評価が代入される
sio = StringIO.open "Hello StringIO" do |io|
  p io.read  #=> "Hello StringIO"
  nil
end
p sio        #=> nil　　sioにnilが代入


#バッファへ書き込むメソッド
sio = StringIO.new
sio.putc "a"
p sio.string      #=> "a"

#バッファを空にしてポインタを０にする
p sio.string = "" #=> ""

#putsメソッド
#２文字以上の文字列を引数に与えると最初の１文字以外は無視する
sio.putc "bcd"
p sio.string     #=> "b"

#引数を省略するとエラーになる
#sio.putc         #=> wrong number of arguments (given 0, expected 1) (ArgumentError)

sio.string = ""
p sio.puts "abc"   #=> nil 
p sio.string       #=> "abc\n"

sio.string = ""
sio.puts "abc", "efg", "hij"
p sio.string       #=> "abc\nefg\nhij\n"

#引数に配列を渡した場合、配列内それぞれの値がバッファに書き込まれる
sio.string = ""
sio.puts ["abcd", "efgh", "ijkl"]
p sio.string       #=> "abcd\nefgh\nijkl\n"

#引数を省略すると改行のみをバッファに書き込む
sio.string = ""
sio.puts
p sio.string       #=> "\n"

#引数にnilを渡した場合、改行のみをバッファに書き込む
sio.string = ""
sio.puts nil
p sio.string       #=> "\n"

#printメソッドは末尾に改行を付加しない
sio.string = ""
sio.print "abc", "def", "efg", "hij"
p sio.string      #=> "abcdefefghij"   

sio.string = ""
sio.print ["abcd", "efgh", "ijkl"]
p sio.string       #=> "[\"abcd\", \"efgh\", \"ijkl\"]"

#printfメソッドはフォーマットに従ってバッファに書き込む
sio.string = ""
sio.printf("%10d\r\n", 123) 
p sio.string      #=> "       123\r\n"
 

#バッファから読み込むメソッド
#readメソッド
sio.string = "Hello world."

p sio.pos         #=> 0
p sio.read 5      #=> "Hello"    #指しているポインタから5文字分を取り出す

p  sio.pos        #=> 5
p  sio.read       #=> " world."  #引数を省略すると指しているポインタから終端までの文字列を取り出す

p sio.pos         #=> 12         #ポインタが文字列の終端に達している
p sio.read        #=> ""         #引数を省略すると空文字を返す

p sio.pos         #=> 12
p sio.read 1      #=> nil        #引数に文字を設定するとnilを返す


sio.pos = 0
output = ""
sio.read 5, output
p output          #=> "Hello"    #第２引数に変数を指定した場合、取り出した文字列を変数に格納する


#getsメソッド
sio.pos = 0
p sio.getc        #=> "H"        #指しているポインタから１文字を返す
sio.pos = sio.string.length
p sio.pos         #=> 12
p sio.getc        #=> nil        #ポインタが文字列の終端に達している場合、nilを返す

#readcharメソッド
sio.pos = 2
p sio.readchar    #=> "l"        #指しているポインタから１文字を返す
sio.pos = sio.string.length  
#p sio.readchar    #=> `readchar': end of file reached (EOFError) #ポインタが文字列の終端に達している場合、EOFErrorを返す


#getsメソッド
sio.string = "Hello World.\nHello IOstring World."
p sio.gets         #=> "Hello World.\n"
p sio.pos          #=> 13

p sio.readline     #=> "Hello IOstring World."
p sio.pos          #=> 34

sio.gets           #=> nil
#sio.readline       #=> `readline': end of file reached (EOFError) #ポインタが文字列の終端に達している場合、EOFErrorを返す

#ポインタを移動するメソッド
#posメソッド
sio.string = "abcdefghijklmnopqrstuvwxyz"
sio.pos = 10
p sio.readline    #=> "klmnopqrstuvwxyz"

#seekメソッド
sio.seek 5, IO::SEEK_SET  #ファイルの先頭から5文字目の場所から返す
p sio.pos         #=> 5
p sio.getc        #=> "f"

p sio.pos         #=> 6
sio.seek 2, IO::SEEK_CUR  #現在のポインタから2文字目の場所から返す
p sio.pos         #=> 8
p sio.getc        #=>"i"

sio.seek -10, IO::SEEK_END #末尾から-10文字目の場所から返す
p sio.pos         #=> 16 
p sio.readline    #=> "qrstuvwxyz"


