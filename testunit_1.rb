require 'test/unit'


class TestSample < Test::Unit::TestCase
  def setup
    File.open('/tmp/a.txt', "w") {|file| file.write "apple\n"}
    File.open('/tmp/b.txt', "w") {|file| file.write "apple\norange\n"} 
  end
  def teardown
  end

  def test_dir
    #ディレクトリの移動
    assert_equal 0, Dir.chdir("/home/orca/sample")
    #カレントデレクトリの取得
    assert_equal "/home/orca/sample", Dir.pwd
    assert_equal "/home/orca/ruby-exercise", Dir.chdir("/home/orca/ruby-exercise"){|dir| Dir.pwd}
    assert_equal "/home/orca/sample", Dir.pwd
    #ディレクトリの作成
    assert_equal 0, Dir.mkdir("/home/orca/foo")
    #ディレクトリの削除
    assert_equal 0, Dir.rmdir("/home/orca/foo")
  end

  def test_read
    file = File.open('/tmp/a.txt')
    #ファイルの読み込み　
    assert_equal "apple\n", file.read
    #ファイルの閉じる
    assert_nil file.close
    #ファイルをブロックで開く
    assert_equal "apple\n",  File.open("/tmp/a.txt") {|file| file.read}
  end

  def test_write
    #ファイルを書き込む
    assert_equal 17, File.open('/tmp/new-file', "w") {|file| file.write "this is new file."}
  end

  def test_directory
    #パスが存在するか調べる
    assert_equal false, File.exist?('/tmp/tmp/')
    #パスがファイルか調べる
    assert_equal true, File.file?("/tmp/a.txt")
    #パスがディレクトリか調べる
    assert_equal true, File.directory?('/tmp/')
    assert_equal false, File.directory?('/home/orca/orca/')
    #ファイルのサイズ
    assert_equal 6, File.size('/tmp/a.txt')
  end

  def test_chmod
    #ファイルの属性を指定
    assert_equal 1, File.chmod(0644, '/tmp/a.txt')
  end

  def test_rename
    #ファイルをリネームする
    assert_equal 0, File.rename('/tmp/a.txt', '/tmp/aa.txt')
    #ファイルを削除する
    assert_equal 1, File.delete('/tmp/aa.txt')
  end

  def test_io
    io = open('/tmp/b.txt')
    #標準出力に書き込む
    assert_equal "apple\norange\n", io.read
    assert_nil io.close
    assert_nil open('/tmp/b.txt'){|io| puts io.read}
    #ファイルを読み取る
    io = File.open('/tmp/b.txt', 'r:utf-8:ascii')
    assert_equal 'appl', io.read(4)
    io.close
    #ファイルを読み取る（一行ずつ）
    io = File.open('/tmp/b.txt')
    assert_equal "apple\n", io.gets
    assert_equal "orange\n", io.gets
    assert_nil io.gets
    io.close
    #ファイルを書き込む
    assert_equal 17, STDOUT.write('this is new apple')
    assert_equal nil, STDOUT.puts('new orange', 'new peach')
  end
  def test_io_write
    #ファイルを書き込む
    io = File.open('/tmp/c.txt', "w")
    assert_equal 17, io.write('this is new apple')
    assert_nil io.puts('new orange', 'new peach', 'old_orange', 'old_apple')
    io.flush
    io.close
    io = File.open('/tmp/c.txt')
    io.gets
    #p io.lineno
    #ファイルの末尾か
    assert_equal false, io.eof?
    #ファイルを閉じたか
    assert_equal false, io.closed?
    io.gets
    io.gets
    io.gets
    assert_equal true, io.eof?
    io.close
    assert_equal true, io.closed?
  end

  def test_io_rewind
    io = File.open('/tmp/c.txt')
    assert_equal "this is new applenew orange\n", io.gets
    assert_equal "new peach\n", io.gets
    #ファイルポインタを先頭に移動
    assert_equal 0, io.rewind
    assert_equal "this is new applenew orange\n", io.gets
    #ファイルポインタを指定して移動
    assert_equal 0, io.pos = 0
    assert_equal "this is new applenew orange\n", io.gets
    #assert_equal 1,io.pos　
    p io.pos
    io.close
  end


end
   
