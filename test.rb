require 'pg'
require 'csv'

db = PG.connect(dbname: 'Rails_Training_development', user: 'thiendoan')
start = Time.now
CSV.foreach('test.csv', 'r') do |rows|
    prf = rows[5].gsub("'","''")
    db.exec("INSERT INTO info (name,email,phone,address,day_of_birth,profile)
     VALUES('#{rows[0]}','#{rows[1]}','#{rows[2]}','#{rows[3]}','#{rows[4]}','#{prf}')")
end
diff = Time.now - start
db.exec("comment on table info is '#{diff}'")

# Phần code e trình bày gọn, biết sử dụng foreach là một điểm cộng
# db.exec, phần này a thấy e đang insert từng dòng vào trong db, tức là với 500k lines thì mình insert 500k lần về performance có thể bị ảnh hưởng 
# do e hit vào db nhiều quá
# A suggest e là 
#   1. sử dụng transaction -> e có thể tìm hiểu nó là gì
#   2. build ra 1 câu sql, nhưng khi nào đủ khoảng 5k lines (do e quyết định), rồi hẵn insert vào db. Như vậy sẽ giảm số lần e tương tác db ah
