input = File.readlines('./007/input.txt')[0].split(',').map{|i| i.to_i}

def calculate_cost_for(pos, numbers)
    numbers.reduce(0) do |cost, curr|                
        diff = (curr - pos).abs      
        #part1  
        # cost += diff
        #part2  
        cost += (diff * (diff+1))/2
        cost
    end
end

def minimum_cost(input)
    total_possible = (input.min..input.max).to_a
    all_costs = total_possible.reduce({}) do |costs, pos|
        costs[pos] = calculate_cost_for(pos, input)
        costs
    end

    return all_costs.sort_by {|_key, value| value}[0]
end

puts minimum_cost(input)

