require 'fileutils'

#ディレクトリの確認、移動を行うコマンド
p FileUtils.cd("/tmp/")   #=> nil 
p FileUtils.pwd           #=> "/tmp"

#ファイルのコピーを行う
FileUtils.cp("/tmp/sample.txt", "/tmp/sample/")
FileUtils.cp("/tmp/sample.txt", "/tmp/sample2.txt")

#ファイルの権限を変更する
FileUtils.chmod(0710, "/tmp/sample2.txt")

#ファイルの移動を行う
FileUtils.mv("/tmp/sample1.txt", "/tmp/sample/")

#ファイルの削除を行う
FileUtils.rm("/tmp/sample.txt")

#ディレクトリの作成を行う
FileUtils.mkdir("/tmp/sample1")

#ディレクトリの削除を行う
FileUtils.rmdir("/tmp/sample1")
