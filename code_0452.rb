#4-52
class Qux4
  def v3
    return @v3
  end
  def v3=(value)
    @v3 = value
  end
  def method1; @v3; end
end

qux4 = Qux4.new
qux4.v3 = 3
p qux4.v3
p qux4.method1

#4-53
class Qux4
  attr_accessor :v3
  def method1; @v3; end
end
qux4 = Qux4.new
qux4.v3 = 3
p qux4.v3
p qux4.method1

#4-54
class Qux4Ext < Qux4
end
qux4Ext = Qux4Ext.new
qux4Ext.v3 = 4
p qux4Ext.v3
