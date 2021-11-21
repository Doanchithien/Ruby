target_sum = 1
arrays =  [3, 5, -4, 8, 11, 1, -1, 6]
n = arrays.length 
hashes = {}
two_nums = []
for i in 0...n
    num = arrays[i].to_i
    check = target_sum - num
    if hashes.has_key?(check)
        two_nums.push(check,num)
        break
    else
        hashes[num] = i
    end
end
print "mang 2 so co tong bang #{target_sum} : #{two_nums}"