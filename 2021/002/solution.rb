input = File.readlines('./002/input.txt').map { |line| line.split(' ') }

x = 0 
y = 0
aim = 0

input.each do |command|
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

puts (x*y)