class Employee
  attr_reader :stt, :id, :name, :position
  def initialize(info = {})
    @stt = info[:stt] 
    @id = info[:id] 
    @name = info[:name]
    @birth = info[:birth]
    @position = info[:position]
    @wage = info[:wage]
    @workday = info[:workday]
  end

  
  def salary
    puts "Luong thang cua nhan vien : #{wage_roll} VND"
  end

  def show_age
    puts "Tuoi cua nhan vien nay la : #{age} tuoi"
  end


  private
  def wage_roll
    sal = @wage*@workday
  end

  def age
    age = Time.now.year - @birth
  end

end

def input
  
end

def check_num(num)
  if num.match(/^[0-9]\d*$/)
    true
  else
    false
  end
end

def check_f(num)
  if num.match(/^(?:[1-9]\d*|0)?(?:\.\d+)?$/)
    true
  else
    false
  end
end

def check_str(str)
  if str.match(/\A[[:alpha:][:blank:]]+\z/)
    true
  else
    false
  end
end


def input
  info = Hash.new
  puts "Nhap stt nhan vien : "
  stt = gets
  while !check_num(stt) do
    puts "Nhap khong hop le,nhap lai STT : "
    stt = gets
  end
  puts "nhap id nhan vien : "
  id = gets
  while !check_num(id) do
    puts "Nhap khong hop le,nhap lai id : "
    id = gets 
  end
  puts "nhap ten nhan vien : "
  name = gets.chomp
  while !check_str(name) do
    puts "Nhap khong hop le,nhap lai ten : "
    name = gets.chomp
  end
  puts "nhap nam sinh nhan vien : "
  birth = gets
  while !check_num(birth) do
    puts "Nhap khong hop le,nhap lai nam sinh : "
    birth = gets
  end
  puts "nhap vi tri cong tac cua nhan vien : "
  position = gets.chomp
  while !check_str(position) do
    puts "Nhap khong hop le,nhap lai vi tri : "
    position = gets.chomp
  end
  puts "nhap luong 1 ngay cua nhan vien : "
  wage = gets
  while !check_num(wage) do
    puts "Nhap khong hop le,nhap lai luong : "
    wage = gets
  end
  puts "nhap so ngay lam cua nhan vien : "
  workday = gets
  while !check_f(workday) do
    puts "nhap khong hop le,nhap lai so ngay : "
    workday = gets
  end

  info={
    :stt => stt.to_i,
    :id => id.to_i,
    :name => name,
    :birth => birth.to_i,
    :position => position,
    :wage => wage.to_i,
    :workday => workday.to_f
  }

end


employee_list = []

while true do
    puts "================================================================"
    puts "1.Them du lieu nhan vien"
    puts "2.In ra thong tin nhan vien"
    puts "3.Thoat"
    puts "================================================================"

    puts "nhap lua chon : "
    choice = gets.to_i
    if choice == 1
      info=input()
      count = 0
      employee_list.each do |i|
        count+=1 if i.stt==info[:stt] || i.id==info[:id]
      end
      if count==0
        em = Employee.new(info)
        employee_list.push(em)
      else
        puts "Trung STT hoac ID!"
        count = 0
      end
    elsif choice == 2
      puts "Danh sach nhan vien : "
      employee_list.each do |i|
          puts "STT : #{i.stt}"
          puts "ID : #{i.id}"
          puts "Ten : #{i.name}"
          i.show_age
          puts "Vi tri : #{i.position}"
          i.salary
      end
    elsif choice == 3
        break
    else
        puts "Nhap lua chon khong hop le...."
    end
end