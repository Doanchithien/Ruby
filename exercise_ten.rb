def check(i,numbers,target_sum,result)
  for j in numbers
      $arr[i] = j 
      if i == 2
          if $arr[0] == $arr[1] || $arr[0] == $arr[2] || $arr[1] == $arr[2]
              break
          else
              if $arr[0] + $arr[1] + $arr[2] == target_sum
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
          check(i+1,numbers,target_sum,result)
      end
  end
end

if __FILE__==$0
  $arr = Array.new(3)
  numbers = [12, 3, 1, 2, -6, 5, -8, 6]
  target_sum = 2
  result = []
  check(0,numbers,target_sum,result) 
  result.uniq.each {|i| print "#{i}\n"}
end