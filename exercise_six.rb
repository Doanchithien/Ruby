def two_num(arrays,target_sum)
  number_hashes = {}

  for i in 0...arrays.length 
     number = arrays[i].to_i
     number_check = target_sum - number
     if number_hashes.has_key?(number_check)
        return number_check,number
        break
     else
        number_hashes[number] = i
     end
   end
   
end



if __FILE__ == $0
  target_sum = 10
  arrays =  [3,5,-4,8,11,1,-1,6]
  print "Mang 2 so co tong bang #{target_sum} la : #{ two_num(arrays,target_sum)}"
end
  