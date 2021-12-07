input = File.readlines('./007/input.txt')[0].split(',').map{|i| i.to_i}

def calculate_cost_for(pos, numbers)
    numbers.reduce(0) do |cost, curr|                
        diff = (curr - pos).abs        
        cost += (diff * (diff+1))/2
        cost
    end
end

total_possible = (input.min..input.max).to_a

costs = total_possible.reduce({}) do |costs, pos|
    costs[pos] = calculate_cost_for(pos, input)
    costs
end

puts costs.sort_by {|_key, value| value}[0]