
module Stepable

    def move_diffs
        # overwritten by subclasses moves
    end

    def moves
        moves_arr = []
        current_pos = self.pos

        move_diffs.each do |deltas|
            dx = deltas[0]
            dy = deltas[1]

            new_pos = [current_pos[0] + dx , current_pos[1] + dy]


            case self.board[new_pos[0]][new_pos[1]].nil?
            when true
                moves_arr << new_pos
            else
                moves_arr << new_pos until self.color == self.board[new_pos[0]][new_pos[1]].color
            end
        end
        
        moves_arr
        #RETURNS EVERY POSSIBLE MOVE OF THAT PIECE
    end

end