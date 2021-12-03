input = File.readlines('./003/input.txt').map { |line| line.strip().split('') }

def find_gaama_and_elipson(input)
    gaama = ''
    eliposon = ''

    input.transpose.each do |entry|
        ones =  entry.count("1")
        zeros =  entry.length - ones
        if ones >= zeros
            gaama += '1'
            eliposon += '0'
        else
            gaama += '0'
            eliposon += '1'
        end
    end
    return [gaama, eliposon]
end

def part_1(input)
    gaama_and_elipson = find_gaama_and_elipson(input)

    gaama_dec = gaama_and_elipson[0].to_i(2)
    eliposon_dec = gaama_and_elipson[1].to_i(2)

    return (gaama_dec * eliposon_dec)

end

def find_till_last(input, pattern, index, is_gaama)   
    if(input.size == 1)
        return input[0]
    end
    search_for = pattern[index]
    new_input = input.select {|entry| entry[index] == search_for}
    new_pattern = find_gaama_and_elipson(new_input)[is_gaama ? 0 : 1]
    return find_till_last(new_input, new_pattern, index+1, is_gaama)
end

def part_2(input)
    gaama_and_elipson = find_gaama_and_elipson(input)
    gaama = gaama_and_elipson[0]
    eliposon = gaama_and_elipson[1]

    o2 = find_till_last(input, gaama, 0, true).join()
    co2 = find_till_last(input, eliposon, 0, false).join()
    o2_dec = o2.to_i(2)
    co2_dec = co2.to_i(2)
    return (o2_dec * co2_dec)
end

puts part_1(input)
puts part_2(input)