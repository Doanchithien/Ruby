require 'csv'
profile= "Like TV 100\", Some special charactor: \\ / ' $ ~ & @ # ( ; \""


CSV.open('abc.csv','wb') do |csv|
    csv << ['name','email','phone','address','day_of_birth','profile']
    for i in 1..500000
        email = "nguyenvana#{i}@gmail.com"
        csv << ['Nguyen Van A',email,123456789,'Ho Chi Minh city','2000/01/01',profile]
    end
end