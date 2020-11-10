class MyError < RuntimeError; end #エラークラスを自作
                                  #RunTimeErrorを継承したクラスを作成
begin
  #例外を発生させる可能性の処理
  raise MyError  #指定した例外を発生させる
rescue => ex     #変数に例外オブジェクトを代入
  #例外が起こった場合の処理
  p ex  #=>  #<MyError: MyError>
end


class MyError < RuntimeError; end
begin
  raise MyError.exception('エラーが発生しました') #エラーメッセージを指定
rescue => ex
  p ex             #=> #<MyError: エラーが発生しました>
  #エラーメッセージを取得 
  p ex.message     #=> "エラーが発生しました"
  #バックトレースを取得（配列で取得）
  p ex.backtrace   #=> ["code_05223.rb:11:in `<main>'"]
  ex.set_backtrace("This is new backtrace") #バックトレース情報にオリジナルの情報を設定
  p ex.backtrace   #=> ["This is new backtrace"]
end




