#callメソッドで実行
f = Proc.new { puts 'OK' }
p f.call  #=> OK

#引数の数を取得
f = Proc.new { |str| puts str }
p f.arity # => 1
p f.call("NG")  #=> NG

f = Proc.new { |str, str1, str2| puts [str, str1, str2] }
p f.arity  #=> 3

#実行時のコンテキスト
i = 30
j = 40
f = Proc.new { puts i + j }
p f.call #=>  70
i = 100
p f.call #=> 140

#ブロックとして使用
f = Proc.new { |i| puts i}
p 3.times(&f)   #変数名の前に&を指定して渡す

#手続きオブジェクトの中での中断
f = Proc.new {
   next "next"   #処理を中断して読み出し元へ戻る
   "last"        #実行されない
}
p f.call  #=> "next"

#手続きオブジェクトにおける引数の数が違う場合
#Proc.new で生成した手続きオブジェクトはエラーにならない
f = Proc.new { |a, b, c| p a, b, c}
p f.call(1, 9) #=> [1, 9, nil]
#lambdaメソッドで生成した手続きオブジェクトはエラーになる
g = lambda { |a, b, c| p a, b, c}
p g.call(1,9) #=> wrong number of arguments (given 2, expected 3) (ArgumentError)

#手続きオブジェクトの中でのジャンプ構文
#breakを使った場合
f = Proc.new {break}  #Proc.new で生成した手続きオブジェクトはエラーが発生する
p f.call  #=> break from proc-closure (LocalJumpError)

g = lambda {break}    #lambdaメソッドで生成した手続きオブジェクトはnilを返す
p g.call  #=> nil

#returnを使った場合
f = Proc.new {return} #手続きオブジェクトの外側を抜けるため、メソッドやブロックの外側ではエラーとなる
p f.call  #=> unexpected return (LocalJumpError)
def foo
  Proc.new {
    return 1
  }.call
  return 2
end
p foo     #=> 1

g = lambda {return}  #手続きオブジェクト自体を抜ける
p g.call  #=> nil

