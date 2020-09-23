#4-55
class Qux5
  @@v1 = 1
  def v1; @@v1; end
  def v1=(value); @@v1=(value); end
end

class Qux5Ext < Qux5
end

qux5 = Qux5.new
p qux5.v1
qux5Ext = Qux5Ext.new
p qux5Ext.v1

#4-56
qux5Ext.v1 = 10
p qux5.v1
Qux5.new.v1 = 100
p qux5.v1

#4-57
class Qux6
  @@v1 = 1
  def v1; @@v1; end
end
 class Qux6Ext < Qux6
  @@v1 = 2
end

p Qux6.new.v1
