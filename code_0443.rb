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

class Baz2Ext < Baz2
  public :private_method1
end

#p Baz2.new.private_method1
p Baz2Ext.new.private_method1

