require 'test/unit'

#5-236
module MyMethods
  def foo
    'bar'
  end
end

class MyClass
  include MyMethods
  FOO = 1
end

#05-244
class MyClass1
  private        #レシーバを付けたよびだしはできない
  def foo
    p "FOO"
  end
  public :foo    #どのインスタンスからの実行できる
                 #これがないとNoMethodError: private method `foo' called for #<MyClass1:0x000000014ed788>となった
end

#5-245
class MyClass2
  attr_accessor :height
end

#5-246
class MyClass3
  def foo
  "foo"
  end
  alias_method :original_foo, :foo
  def foo
    "bar " + original_foo
  end
end

#5-247
Array.class_eval do
  def foo
    "bar,bar1,bar2"
  end
end

#5-248
class MyClass4
  CONST = 1
 end

#5-249
class MyClass5
  @@foo = 1
  @@foo1 = 2
end

#5-252
module MyMethods6
  def foo
    "bar"
  end
end
module MyMethods61
  def foo1
    "BAR1"
  end
end

class MyClass6
  include MyMethods6
end
class NewMyClass; end

module MyMethods7
  def bar
    puts "OK"
  end
  module_function :bar #bar がモジュール関数になる
end

class TestSample < Test::Unit::TestCase
  def test_module
    #includeメソッドを使って任意のクラスにインクルードできる
    assert_equal "bar", MyClass.new.foo
    #Module.constantsでその時点で定義されている定数を取得できる
    p Module.constants
    #constantsメソッドで特定のクラスやモジュールで定義されている定数を取得できる
    assert_equal "[:FOO]", MyClass.constants.to_s
    #const_definds_メソッドで指定された定数が定義されているか確認できる
    assert_equal true, Object.const_defined?(:ENV)
    assert_equal false, Object.const_defined?(:EVVIRONMENT)
    assert_equal true, Object.const_defined?(:TRUE)
    #const_getメソッドで定数の値を撮り出す
    assert_equal "2.3.1", Object.const_get(:RUBY_VERSION)
    #const_setメソッドで新たに定数を定義して設定する
    assert_equal "myconst", Object.const_set(:MY_CONST, 'myconst')
    assert_equal "myconst", Object::MY_CONST
    #メソッドの可視化の変更
    my_class = MyClass1.new
    assert_equal "FOO", my_class.foo
    #インスタンス属性として設定
    my_class = MyClass2.new
    my_class.height = 200
    assert_equal "200", my_class.height.to_s
    #alias_method でメソッドの別名を定義
    m = MyClass3.new
    assert_equal "bar foo", m.foo
    #モジュールのコンテキストで評価
    assert_equal "bar,bar1,bar2", [].foo
    assert_nil MyClass4.class_exec(3) { |i| puts i + self::CONST }
    #クラス変数の一覧を返す
    assert_equal "[:@@foo, :@@foo1]", MyClass5.class_variables.to_s
    #指定されたクラス変数が定義されているか
    assert_true MyClass5.class_variable_defined?(:@@foo)
    assert_false MyClass5.class_variable_defined?(:@@foo3)
  end
  def test_module1
    #クラスやインスタンスにモジュールの機能を取り込む
    assert_equal "bar", MyClass6.new.foo
    n = NewMyClass.new
    n.extend(MyMethods6)
    assert_equal "bar", n.foo
    #インクルードされているか調べる
    assert_true MyClass6.include?(MyMethods6)
    assert_false MyClass6.include?(MyMethods61)
    assert_equal "[MyMethods6, Kernel]", MyClass6.included_modules.to_s
    #モジュール関数にする
    assert_nil MyMethods7.bar 
  end
end
   
