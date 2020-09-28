class Baz2
  def public_method1
    private_method1    #レシーバを省略
  end
  def public_method2
    self.private_method1 #レシーバを指定してるので実行不可
  end
  private
  def private_method1;  end
end

p Baz2.new.public_method1
p Baz2.new.public_method2



