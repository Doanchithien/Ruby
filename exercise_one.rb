arr = [] # mảng bao gồm nhiều phần tử, nên là số nhiều -> arrs
puts "nhap -1 de dung nhap!"
while arr.length <= 99 do
    begin
        puts "nhap vao so nguyen :"
        x = Integer(gets)
        if x >= 0
            arr.push(x)
        elsif x==-1
            break
        else
            puts "vui long nhap so tu nhien..."
        end
    rescue
        puts "Nhap khong hop le,vui long nhap lai....."
        retry
      end
end
puts "mang da nhap la : #{arr}"
min=arr[0] # Nên có dấu cách ra để dễ nhìn -> min = arr[0]
arr.each do |i|
    min=i if i<min
end

puts "phan tu nho nhat trong mang la : #{min}"
# Chương trình của e chạy tốt, nhưng để tốt hơn nữa thì con số 99 và -1 mình có thể thay đổi, lúc đó trong hàm của mình sẽ chỉnh sửa
# nên e có thể đặt hằng số, vd: STOP_SIGNAL = -1 hay MAX_CAPACITY = 99
