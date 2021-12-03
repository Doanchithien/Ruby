def check(length_config,numbers,target_sum,result)
  for j in numbers
      $arr[length_config] = j 
      if length_config == 2
          if $arr[0] == $arr[1] || $arr[0] == $arr[2] || $arr[1] == $arr[2]
              break
          else
              if $arr[0] + $arr[1] + $arr[2] == target_sum
                  check_exist_result = true
                  if $arr[0] > $arr[1] && $arr[0] > $arr[2]
                      if $arr[1] > $arr[2]
                          result.push([$arr[2],$arr[1],$arr[0]])
                      else
                          result.push([$arr[1],$arr[2],$arr[0]])
                      end
                  elsif $arr[1] > $arr[0] && $arr[1] > $arr[2]
                      if $arr[0] > $arr[2]
                          result.push([$arr[2],$arr[0],$arr[1]])
                      else
                          result.push([$arr[0],$arr[2],$arr[1]])
                      end
                  else
                      if $arr[0] > $arr[1]
                          result.push([$arr[1],$arr[0],$arr[2]])
                      else
                          result.push([$arr[0],$arr[1],$arr[2]])
                      end
                  end
              end
          end
      else
          check(length_config+1,numbers,target_sum,result)
      end
  end
end

if __FILE__==$0
  $arr = Array.new(3)
  numbers = [12, 3, 1, 2, -6, 5, -8, 6]
  target_sum = 0
  length_config = 0
  result = []
  check(length_config,numbers,target_sum,result) 
  unless result.empty?
    result.uniq.each {|i| print "#{i}\n"}
  else
    print []
  end
end