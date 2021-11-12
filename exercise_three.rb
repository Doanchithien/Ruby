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