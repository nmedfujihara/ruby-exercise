class Baz1
  def public_method1; 1; end  #デフォルトはpublic
  public
  def public_method2; 2; end
  protected
  def protected_method1; 1; end
  def protected_method2; 2; end #同じ可視性が継続される
  private
  def private_method1; 1; end
  public
  def public_method3; 3; end
end

p Baz1.new.public_method1
p Baz1.new.public_method2
p Baz1.new.public_method3

p Baz1.new.protected_method1
p Baz1.new.protected_method2

p Baz1.new.private_method1

