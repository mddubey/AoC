input = File.readlines('./006/input.txt')[0].split(',').map{|i| i.to_i}

school = {}

(0..8).each do |timer|
    school[timer] = 0
end

input.each do |timer|     
    school[timer] += 1
end

(1..256).each do |_|
    ready_to_generate = school[0]
    school[0] = school[1]
    school[1] = school[2]
    school[2] = school[3]
    school[3] = school[4]
    school[4] = school[5]
    school[5] = school[6]
    school[6] = school[7]
    school[7] = school[8]
    school[6] += ready_to_generate
    school[8] = ready_to_generate
end

puts school.values.reduce(:+)