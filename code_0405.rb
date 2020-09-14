class Foo 
  def initialize(a)
    @a = a
  end
  def method1
    @a
  end
end

class FooExt < Foo
  def initialize(a, b)
    @b = b
    super a
  end
  def method2(c)
    @a + @b + c
  end
end
fooExt = FooExt.new(3, 4)
p fooExt.method1
p fooExt.method2(5)

FooExt.superclass == Foo

