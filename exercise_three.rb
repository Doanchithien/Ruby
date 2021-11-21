require 'pg'
require 'csv'

db = PG.connect(dbname: 'Rails_Training_development', user: 'thiendoan')
start = Time.now
my_query = "INSERT INTO info (name,email,phone,address,day_of_birth,profile) VALUES"
count = 0
CSV.foreach('info.csv', 'r') do |rows|
    prf = rows[5].gsub("'","''")
    if count == 0
      my_query = my_query.concat("")
    elsif count == 500000
      my_query= my_query.concat("('#{rows[0]}','#{rows[1]}','#{rows[2]}','#{rows[3]}','#{rows[4]}','#{prf}');")
    else
      my_query= my_query.concat("('#{rows[0]}','#{rows[1]}','#{rows[2]}','#{rows[3]}','#{rows[4]}','#{prf}'),")
    end
    count+=1
end
db.exec(" BEGIN;
    #{my_query}   
    COMMIT;
    ")
diff = Time.now - start
db.exec("comment on table info is 'This process take : #{diff}s'")

#This process take : 9.968777503s
