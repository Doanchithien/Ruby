arr = []
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
min=arr[0]
arr.each do |i|
    min=i if i<min
end

puts "phan tu nho nhat trong mang la : #{min}"
