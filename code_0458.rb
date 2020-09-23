#4-58
A = 1
p A
A = 2
P A

#4-59
def func
  B = 2
end

#4-60
module B; end
B::A = 1
B::A::A = 1

#4-61
module M
  A = 1
  class B
    A = 2
  end
  class C
  end
end

#4-62
p M::A
p M::B::A

#4-63
module M
  p A
  p B::A
end

#4-64
p M.constants
p M::B.constants
p M::C.constants

#4-65
module M
  p ::M::A
  p ::M::B::A
end

#4-66
module M
  class C
  p A
  end
end

#4-67
class Foo
  A = 1
end

module Bar
  B = 2
end

class FooEx < Foo
  include Bar
  p A
  p B
end

#4-68
module M
  def self.const_missing(id)
    1
  end
end
M::HOGE
