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

p Foo.ancestors
p FooExt.ancestors

p Foo < Object
p Foo > Object

foo1 = Foo.new(1)
fooExt = FooExt.new(3, 4)

p Foo.instance_methods(false)
p FooExt.instance_methods(false)
p foo1.instance_variables
p fooExt.instance_variables
