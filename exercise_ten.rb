def sum(arrays)
    arrays[0] + arrays[1] + arrays[2]
end

def three_nums(arrays,target_sum)
    result = []
    #sort configs and compare with target sum
    arrays.each do |a|
        unless a[0] == a[1] || a[0] == a[2] || a[1] == a[2]
          if sum(a) == target_sum  
            if a[0] > a[1] && a[0] > a[2]
                if a[1] > a[2]
                    result.push([a[2],a[1],a[0]])
                else
                    result.push([a[1],a[2],a[0]])
                end
            elsif a[1] > a[0] && a[1] > a[2]
                if a[0] > a[2]
                    result.push([a[2],a[0],a[1]])
                else
                    result.push([a[0],a[2],a[1]])
                end
            else
                if a[0] > a[1]
                    result.push([a[1],a[0],a[2]])
                else
                    result.push([a[0],a[1],a[2]])
                end
            end
          end
        end
    end
    #remove duplicate configs 
    result = result.uniq
    unless result.empty?
         print result
    else
        print []
    end
end

# function generate a config,three numbers per config
def config_nums(length_config,numbers,arrays,configs)
    for j in numbers
        arrays[length_config] = j 
        if length_config == 2
            configs.push([arrays[0],arrays[1],arrays[2]])
        else
            config_nums(length_config+1,numbers,arrays,configs)
        end
    end
end
  
if __FILE__ == $0
    arrays = Array.new(3)
    numbers = [12, 3, 1, 2, -6, 5, -8, 6]
    target_sum = 0
    length_config = 0
    configs = []
    config_nums(length_config,numbers,arrays,configs)
    three_nums(configs,target_sum)
end
