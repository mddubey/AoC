input = File.readlines('./004/input.txt')

def parse_input(input)
    draws = input[0].strip().split(',')
    rest = input[1, input.length]

    boards_input = rest.each_slice(6).map {|row_with_blankline| row_with_blankline[1, 6]}
    boards = boards_input.map do |bi|
        bi.map {|row| row.strip().split(' ')}
    end

    return {:draws => draws, :boards => boards}
end

def check_for_win_rows(boards, winning_boards)
    winning_board_index = -1
    boards.each_with_index do |board, index|
        max_flagged = board.map{|r| r.count('X')}.max
        if max_flagged == 5 && !winning_boards.key?(index)
            winning_board_index = index
            break
        end
    end
    return winning_board_index
end

def check_for_win_cols(boards, winning_boards)
    return check_for_win_rows(boards.map{|b| b.transpose()}, winning_boards)
end

def play(game)
    # game[:board_flags] = game[:boards].map {|b| Array.new(5) {Array.new(5)}}
    winning_boards = {}
    game[:draws].each do |draw|
        boards = game[:boards]    
            
        game[:boards].each_with_index do |board, index|        
            board.each_with_index do |row, i|
                row.each_with_index do |cell, j|                
                    if cell == draw
                        game[:boards][index][i][j] = 'X'
                    end
                end
            end
        end 
        
        winning_index = -1
        winning_row = check_for_win_rows(game[:boards], winning_boards)
        if winning_row != -1
            winning_index = winning_row
            winning_boards[winning_index] = true
        end
        winning_col = check_for_win_cols(game[:boards], winning_boards)
        if winning_col != -1
            winning_index = winning_col
            winning_boards[winning_index] = true
        end                                            
        
        if game[:boards].length == winning_boards.length
            return [winning_index, draw]
        end
    end
end
game = parse_input(input)

game_result = play(game)
winning_index = game_result[0]
last_draw = game_result[1]

winning_board = game[:boards][winning_index.to_i]
sum = winning_board.flatten.reduce(0) {|agg, val| agg + val.to_i}
puts (sum * last_draw.to_i)
