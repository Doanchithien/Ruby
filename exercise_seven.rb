def child_array?(arrays_one,arrays_two)
    hashes = {}
    check_arrays = []
    for i in 0...arrays_one.length
        hashes[arrays_two[i]] = i if i < arrays_two.length
        if hashes.has_key?(arrays_one[i])
            check_arrays.push(arrays_one[i])
            check_arrays.pop() unless check_arrays == arrays_two[0...check_arrays.length]
        end
    end
    if check_arrays == arrays_two
        true
    else
        false
    end
end


if __FILE__ == $0
    arrays_one = [1,5,22,-1,1,8,26,6,-1,1,8,1,10,9,10]
    arrays_two = [1,6,-1,8,1,9,10]
    if child_array?(arrays_one,arrays_two)
        print "Mang b la mang con cua mang a\n"
    else
        print "Mang b khong la mang con cua a\n"
    end
end