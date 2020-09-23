#4-48
v1 = 1
class Qux1
  p v1
end

#4-49
v1 = 1
class Qux2
  v2 = 2
  def method1; v1;end
  def method2; v2;end
end
Qux2.new.method1
Qux2.new.method2

#4-50
$v1 = 1
class Qux2
  $v2 = 2
  def method1; $v1; end
  def method2; $v2; end
end
p Qux2.new.method1
p Qux2.new.method2

#4-51
@v1 = 1
class Qux2
  @v2 = 2
  def method1; @v1; end
  def method2; @v2; end
end
p Qux2.new.method1
p Qux2.new.method2

