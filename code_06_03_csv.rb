require 'csv'

#CSV.openによるCSVデータの読み込み
CSV.open("sample.csv") do |csv|
  csv.each do |row|
    p row
  end
end
#=>実行結果
#["abc", "def", "efg", "hijk"]
#["123", "456", "789", "10"]
#["ABCDEFG", "HIJKLM", nil, nil]


#CSV.openによるCSVデータの書き込み
CSV.open("sample_write.csv", "w") do |row|
  row << ["abc", "def", "ghijk"]
  row << ["lmn", "opq", "rstuv"]
end

#CSV.readメソッド、CSV.readlineメソッドによるCSVデータの読み込み
CSV.read("sample.csv")

CSV.readlines("sample.csv")

#optionsに{headers: true}を渡した場合
csv_table = CSV.read("sample.csv", headers: true)
p csv_table         #=> #<CSV::Table mode:col_or_row row_count:3>
p csv_table.to_a    #=> [["abc", "def", "efg", "hijk"], ["123", "456", "789", "10"], ["ABCDEFG", "HIJKLM", nil, nil]]
