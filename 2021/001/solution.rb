input = File.readlines('./001/input.txt').map { |line| line.to_i }

def count_increasing(measurements)    
    consecutive_measurements = measurements.each_cons(2)
    return consecutive_measurements.map{|last, curr| curr>last}.count(true)    
end

def part_1(measurements)    
    return count_increasing(measurements)
end

def part_2(measurements)
    sliding_windows_of_3 = measurements.each_cons(3)
    sum_sliding_windows = sliding_windows_of_3.map{|window| window.reduce(:+)}
    return count_increasing(sum_sliding_windows)
end

puts part_1(input)
puts part_2(input)
