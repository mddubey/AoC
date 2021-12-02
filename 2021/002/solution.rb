input = File.readlines('./002/input.txt').map { |line| line.split(' ') }

submarine = {x: 0, y: 0, aim: 0}

def part_1(submarine, instructions)
    instructions.each do |command|
        dir = command[0]
        magnitude = command[1].to_i
        if dir == "forward"
            x = x + magnitude
            y = y + (aim * magnitude)
        elsif dir == "down"
            aim = aim + magnitude
        elsif dir == "up"
            aim = aim - magnitude
        else
            puts "unknown"
        end
    end
    
end

# input.each do |command|
#     dir = command[0]
#     magnitude = command[1].to_i
#     if dir == "forward"
#         x = x + magnitude
#         y = y + (aim * magnitude)
#     elsif dir == "down"
#         aim = aim + magnitude
#     elsif dir == "up"
#         aim = aim - magnitude
#     else
#         puts "unknown"
#     end
# end

puts submarine
# puts (x*y)