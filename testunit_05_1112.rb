require 'test/unit'


class TestSample < Test::Unit::TestCase
  #def setup
  #end
  #def teardown
  #end

  def test_time
    #Timeオブジェクトの生成
    #5-193 引数で指定した起算時からの秒数に対応するTimeオブジェクトを生成
    assert_equal "2009-02-14 08:31:30 +0900", Time.at(1234567890).to_s
    #5-194 与えられた引数に対応するTimeメソッドを生成
    #（７個までは、年、月、日、時、秒、マイクロ秒）
    assert_equal "2017-01-01 00:00:00 +0900", Time.mktime(2017).to_s
    assert_equal "2022-10-22 00:00:00 +0900", Time.mktime(2022, 10, 22).to_s
    #5-195 １０個の場合は、秒、分、時、日、月、年、曜日に対応する数値、年日、夏時間かどうかの真理値、タイムゾーン
    assert_equal "2019-10-07 00:00:00 +0900", Time.mktime(0, 0, 0, 7, 10, 2019, 4, 189, true, "JST").to_s
    #5-196 引数の数や順序は同じ、タイムゾーンがＵＴＣになる
    assert_equal "2017-01-01 00:00:00 UTC", Time.gm(2017).to_s
    assert_equal "2019-10-25 00:00:00 UTC", Time.gm(2019, 10, 25).to_s
    #5-197 Timeオブジェクトの属性を取得
    p t = Time.mktime(2017, "feb", 10, 12, 11, 10, 9)
   assert_equal "2017", t.year.to_s
   assert_equal "2", t.month.to_s
   assert_equal "10", t.day.to_s
   assert_equal "12", t.hour.to_s
   assert_equal "11", t.min.to_s
   assert_equal "10", t.sec.to_s
   assert_equal "9", t.usec.to_s
   assert_equal "5", t.wday.to_s
   assert_equal "41", t.yday.to_s
   assert_equal false, t.dst?
   assert_equal false, t.isdst
   assert_equal false, t.gmt?
   assert_equal false, t.utc?
   assert_equal 32400, t.gmtoff
   #5-202 タイムゾーンを変更
   p t.object_id
   t1 = t.getlocal
   p t1.object_id
   #5-203 Timeオブジェクトの演算
   p t = Time.mktime(2017, 1, 2, 3, 4, 5, 6)
   # +メソッドで指定した秒数後のTimeオブジェクトを返す
   tt = t + 60 * 60 * 3
   assert_equal "2017-01-02 06:04:05 +0900", tt.to_s
   # -メソッドで指定した秒数前のTimeオブジェクトを返す
   tt = t - 60 * 60 * 2
   assert_equal "2017-01-02 01:04:05 +0900", tt.to_s
   #5-205 Timeオブジェクトの変換
   #起算時からの秒数を整数で返す
   assert_equal 1483293845, t.to_i
   #浮動小数点数で返す
   assert_equal 1483293845.000006, t.to_f
   #秒、分、時、日、月、年、曜日に対応する数値、年日、夏時間かどうかの真理値、タイムゾーンの順に配列で返す
   assert_equal [5, 4, 3, 2, 1, 2017, 1, 2, false, "JST"], t.to_a
   #UNIXコマンドのdateコマンドのような形式の文字列を返す
   assert_equal "2017-01-02 03:04:05 +0900", t.to_s
   #指定したフォーマットにしたがって文字列に変換した結果を返す
   assert_equal "2017年01月02日 03時04分05秒", t.strftime("%Y年%m月%d日 %H時%M分%S秒")
   assert_equal "17 January 02 Monday", t.strftime("%y %B %d %A")
   t = Time.mktime(2017, 1, 2, 3, 4, 5, 6)
   assert_equal "2017-01-02 03:04:05 +0900", t.to_s
   assert_equal "2017年01月02日 03時04分05秒", t.strftime("%Y年%m月%d日 %H時%M分%S秒")
   assert_equal "17 January 02 Monday", t.strftime("%y %B %d %A")
  end

  def eest_regexp
    #5-212 正規表現でマッチング
    a = Regexp.new("abc")
    assert_equal 0, "abcdefg" =~ "a"
    assert_equal 0, a =~ "abcdefg"
    #5-212 
    assert_eqial true, a === "abcdefg"
    #5-214 
    $_ = "abcdefg"
    a = Regexp.new("abc")
    assert_equal 0, ~ a
    #5-215 正規表現で特殊文字をエスケープする
    assert_equal "array\\.push\\(hash\\[key\\]\\)", Regexp.escape("array.push(hash(hash[key])")
    #5-217 マッチした結果を取得する
    assert_equal 0, /(abc)d(efg)/ =~ "abcdefghijklmnopqrstuvwxyz"
    assert_equal "abcdefg", Regexp.Last_match(0)
    assert_equal "abcdefg", $&
    assert_equal "abc", Regexp.last_match(1)
    assert_equal "abc", $1
    #5-218 正規表現の論理和を求める
    b = Regexp.new("abc")
    c = Regexp.union(a, b)
    assert_equal 0, c =~ "abc"
    #5-219 正規表現のオプションや属性を取得
    a = Regexp.new("abcdefg", Regexp::MULTILINE | Regexp::IGNORECASE)
    assert_equal 5, a.options
    assert_equal 0, a.options & Regexp::EXTENDED
    #5-222 
    assert_equal "abcdefg", a.source
    assert_equal "(?mi-x:abcdefg)", a.to_s
    assert_equal "/abcdefg/mi", a.inspect
    #5-220
    assert_equal false, a.castold?
    a = Regexp.new("abcdefg")
    assert_equal false, a.castold?
  end
end
