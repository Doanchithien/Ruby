def child_array?(arrays_one,arrays_two)
    hashes = {}
    check_arrays = []
    for i in 0...arrays_one.length
        hashes[arrays_two[i]] = i if i < arrays_two.length
        if hashes.has_key?(arrays_one[i])
            check_arrays.push(arrays_one[i])
            check_arrays.pop() unless check_arrays[-1] == arrays_two[check_arrays.length - 1]
        end
    end
    check_arrays == arrays_two
end


if __FILE__ == $0
    arrays_one = [1,5,22,-1,1,8,9,26,6,-1,1,8,1,10,9,10]
    arrays_two = [1,6,-1,8,1,9,10]
    print "Mang b la mang con cua a? : #{child_array?(arrays_one,arrays_two)}\n"
end