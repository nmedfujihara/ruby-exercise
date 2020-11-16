require 'test/unit'

#与えられたブロックを評価した結果の配列を返す
class MyClass
   def sample
     [1, 2, 3, 4, 5, 6].map {|i| i **2 }
   end
end

#要素とそのインデックスをブロックに渡して繰り返す
class MyClass1
  def sample
    [:a, :b, :c, :d, :e].each_with_index {|i, j| puts "#{i} => #{j}" }
  end
end

#自身のたたみ込み演算を行う（初期値と自身の要素を順に組み合わせて結果を返す）
class MyClass2
  def sample
    #inject(2)が初期値
    [1, 2, 3, 4, 5].inject(2) { |result, v| result + v ** 2 }
  end
end

class MyClass3
  @@nums = [1, 2, 3, 4, 5]
  @@datas = ["aaa", "b", "cc"]

  #ブロックを評価して最初に真となる要素を返す
  def sample_find
    @@nums.find { |i| i % 2 == 0 }
  end

  #ブロックを評価して最初に真となる要素のインデックスを返す
  def sample_find_index
    @@nums.find_index { |i| i % 2 == 0 }
  end

  #ブロックを評価して真となる要素を全部返す
  def sample_select
    @@nums.select { |i| i % 2 == 0 }
  end

  #要素を<=>メソッドで比較して昇順にソートした新しい配列を生成して返す
  def sample_sort
    @@datas.sort { |a, b| a.length <=> b.length }
  end
  
  #ブロックの評価結果を<=>メソッドで比較して昇順にソートした新しい配列を生成する
  def sample_sort_by
    @@datas .sort_by { |i| i.length }
  end
end 

class MyClass4
  #要素の最大値を返す
  def sample_max
    (1..10).max { |a, b| ( a % 5 + a) <=> ( b % 5 + b)}
  end

  #ブロックの評価結果が最大であった要素を返す　　
  def sample_max_by
    (1..10).max_by { |v| v % 5 + v }
  end

  #要素の数を返す
  def sample_count
    [1, 2, 3, 4, 5].count
  end

  #ブロックの評価結果をキーとし、同じキーを持つ要素を配列としたハッシュを返す
  def sample_group_by
    (1..10).group_by { |v| v % 2 }
  end 
end

class MyClass5
  @@a1 = [:a, :b, :c]
  @@a2 = [1, 2, 3]
  @@a3 = ["a", "b", "c"]
  @@b  = [:a, :b, :c, :d, :e]
  @@b1 = [1, 2, 3, 4, 5]

  #自身と引数に指定した入れtから一つずつ要素を取り出して配列を作り、それを要素とする配列を返す
  def sample_zip
    @@a1.zip(@@a2, @@a3)
  end

  #先頭から指定した数の要素を配列として返す
  def sample_take
    @@a1.take(2)
  end

  #数を指定しない場合、先頭の要素のみ返す
  def sample_first
    @@a1.first
  end

  #先頭からブロックを評価し、最初に偽になった要素の直前まで返す
  def sample_take_while
    @@b.take_while { |e| e != :d } 
  end

  #先頭から指定した数の要素を覗いた残りの要素を配列として返す
  def sample_drop
    @@b.drop(3)
  end

  #先頭からブロックを評価し、最初に偽になった要素の手前まで切り捨て残りの要素を配列として返す
  def sample_drop_while
    @@b.drop_while { |e| e != :c }
  end

  #ブロックの評価が偽になった要素を含む配列を返す
  def sample_reject
    @@b1.reject { |e| e % 2 == 0 }
  end
end 


class TestSample < Test::Unit::TestCase
  def test_module
    #与えられたブロックを評価した結果の配列を返す
    a = MyClass.new
    assert_equal "[1, 4, 9, 16, 25, 36]", a.sample.to_s
    #要素とそのインデックスをブロックに渡して繰り返す
    a = MyClass1.new
    p  a.sample
    assert_equal "[:a, :b, :c, :d, :e]", a.sample.to_s
    #
    a = MyClass2.new
    assert_equal 57,a.sample
    #全ての要素が真であればture
    assert_false  [1, nil, 3].all?
    assert_true [].all?
    #真である要素が一つでもあればtrueを返す
    assert_true [1, nil, 3].any?
    assert_false [].any?
    #指定された値と==メソッドがtrueとなる要素があるときにtrueを返す
    assert_true [1, 2, 3, 4, 5].include?(3)
    assert_false [1, 2, 3, 4, 5].include?(10)
    #
    a = MyClass3.new
    assert_equal 2, a.sample_find
    assert_equal 1, a.sample_find_index
    assert_equal "[2, 4]", a.sample_select.to_s
    assert_equal '["b", "cc", "aaa"]', a.sample_sort.to_s
    assert_equal '["b", "cc", "aaa"]', a.sample_sort_by.to_s  
    #
    a = MyClass4.new
    assert_equal "9", a.sample_max.to_s
    assert_equal "9", a.sample_max_by.to_s
    assert_equal 5, a.sample_count
    assert_equal "{1=>[1, 3, 5, 7, 9], 0=>[2, 4, 6, 8, 10]}", a.sample_group_by.to_s
    #
    a = MyClass5.new
    assert_equal "[:a, :b, :c]", a.sample_take_while.to_s
    assert_equal "[:d, :e]", a.sample_drop.to_s
    assert_equal "[:c, :d, :e]", a.sample_drop_while.to_s
    assert_equal "[1, 3, 5]", a.sample_reject.to_s 
 end
end
   
