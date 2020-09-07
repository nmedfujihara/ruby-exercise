p 11
class Foo
  p 12
  def initialize(a)
    @a = a
  end
  p 13
  def method1
    @a
  end
end
p 14

c = Foo
c.new (4)
c.method1


foo1 = Foo.new(1)
foo2 = Foo.new(2)
p foo1.method1
p foo2.method1

Foo = 1

