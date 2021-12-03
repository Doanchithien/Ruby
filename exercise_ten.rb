def check(length_config,numbers,target_sum,result,arrays)
    for j in numbers
        arrays[length_config] = j 
        if length_config == 2
            if arrays[0] == arrays[1] || arrays[0] == arrays[2] || arrays[1] == arrays[2]
                break
            else
                if arrays[0] + arrays[1] + arrays[2] == target_sum
                    if arrays[0] > arrays[1] && arrays[0] > arrays[2]
                        if arrays[1] > arrays[2]
                            result.push([arrays[2],arrays[1],arrays[0]])
                        else
                            result.push([arrays[1],arrays[2],arrays[0]])
                        end
                    elsif arrays[1] > arrays[0] && arrays[1] > arrays[2]
                        if arrays[0] > arrays[2]
                            result.push([arrays[2],arrays[0],arrays[1]])
                        else
                            result.push([arrays[0],arrays[2],arrays[1]])
                        end
                    else
                        if arrays[0] > arrays[1]
                            result.push([arrays[1],arrays[0],arrays[2]])
                        else
                            result.push([arrays[0],arrays[1],arrays[2]])
                        end
                    end
                end
            end
        else
            check(length_config+1,numbers,target_sum,result,arrays)
        end
    end
  end
  
  if __FILE__ == $0
    arrays = Array.new(3)
    numbers = [12, 3, 1, 2, -6, 5, -8, 6]
    target_sum = 0
    length_config = 0
    result = []
    check(length_config,numbers,target_sum,result,arrays) 
    unless result.empty?
      result.uniq.each {|i| print "#{i}\n"}
    else
      print []
    end
  end
