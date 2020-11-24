#スレッドを作成
t = Thread.new { sleep 1 }
t = Thread.new(3) { |t| sleep t }


#スレッドの状態
a = Thread.new { sleep 100 }
sleep 5
p a.status    #=> "sleep"
p a.alive?    #=> true

#スレッドの実行、一時停止、終了
b = Thread.new do
  Thread.stop
  puts "OK\n" 
end
sleep 5
p b.status    #=> "sleep"
p b.run       #=> #<Thread:0x00000001fc32e8@code_05_285.rb:13 run>
p b.status    #=> "run"

c = Thread.new do
  Thread.exit
end
sleep 5
p c           #=> #<Thread:0x000000011a7290@code_05_285.rb:22 dead>
p c.status    #=> false

#スレッド終了時のensure節
d = Thread.new do
  begin
    sleep 10000
  ensure
    puts "killed"
  end
end
sleep 5
p d.kill     #=> #<Thread:0x0000000246a2d8@code_05_285.rb:30 sleep>
sleep 5
p d          #=> #<Thread:0x0000000246a2d8@code_05_285.rb:30 dead>
p d.status   #=> false    

#スレッド中の例外
f = Thread.new { Thread.pass; raise "Raise exception" }
e = Thread.new do
  begin
    f.join
  rescue => ex
    puts ex.message
  end
end

#スレッドのリスト
p Thread.list    #実行中のスレッドのリストを取得 
p Thread.main    #メインスレッドを取得
p Thread.current #カレントスレッドを取得


#スレッド固有のデータ
g = Thread.current
t[:foo] = "Bar"  #              データに固有の名前をつけて保持できる
p t[:foo]        #=> ture       データが保持されているか
p t.key?(:foo)   #=> [:foo]     保持している名前を取得
p t.keys


#スレッドを使用しない場合とした場合の出力結果の違いを確認してみる。
#スレッドを使用しない例
def time1
  sleep(5)
  puts Time.now.strftime("%H時%M分%S秒")
end

def time2
  sleep(5)
  puts Time.now.strftime("%H時%M分%S秒")
end

#sleepで設定した5秒の時間差が出る
time1 #=> 11時52分41秒 
time2 #=> 11時52分46秒

#スレッドを使用した例
threads = []
threads << Thread.new { time1() }
threads << Thread.fork { time2() }
threads.each { |thr| thr.join }

#time1とtime2の出力結果が同じ
#=> time1  11時52分51秒
#=> time2  11時52分51秒 





