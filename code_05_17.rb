class Sample
  include Comparable

  def initialize(value)
    @value = value
  end

  def value
    @value
  end
     
  def <=>(other)
    other.value <=> self.value #=> -1
                                #=> 指定していないとcomparison of Sample with Sample failed (ArgumentError)
  end
end

p  a = Sample.new(10)  
p  b = Sample.new(5)  
p  a < b               #=> true
                       #   Comparble がインクルードされていないとNoMethodError: undefined method `<' for #<Sample:0x00000001eaf758 @value=10>となる
p  a <= b              #=> true　
p  a == b              #=> false
p  a > b               #=> false
p  a >= b              #=> false
p  7.between?(6, 11)   #=> true
p  2.between?(6, 11)   #=> false
p  'cat'.between?('ant', 'dog') #=> ture
p  'gnu'.between?('ant', 'dog') #=> false
