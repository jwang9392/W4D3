require "byebug"

module Slideable

    #                      N        S       W      E   
    HORIZONTAL_DIRS = [ [-1, 0], [1, 0], [0, -1], [0, 1] ]
    DIAGONAL_DIRS = [ [-1, 1], [-1, 1], [1, 1], [1, -1] ]
    #                    NE      NW       SE       SW

    def horizontal_dirs 
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def move_dirs
        #will show which one of our 2 dirs methods above
        #the specific subclass will use
        # for rook: return horizontal_dirs
        # for bishop: return diagonal_dirs
        # for queen: both
    end

    # takes 1 sub in #move_dirs, current pos (self.pos), 
    # next pos based on #move_dir 
    # add pos to moves arr if conditions are met
    # if no piece, add pos to arr
    # loop until hit a piece
    # if theres a piece in the way
    # considering color of piece in the way
    def grow_unblocked_moves_in_dir(dx, dy) # dx = -1, dy = 0
# debugger
        moves_array = [] # [ [3, 3] ]
        current_pos = self.pos # [4, 3]
# debugger
        i = 1  # i = 2
        new_pos = [current_pos[0] + dx, current_pos[1] + dy]
        # new_pos = [ 3 , 3 ]
        while self.board[new_pos[0]][new_pos[1]] == nil
            moves_array << new_pos
            i += 1
            new_pos = [current_pos[0] + dx * i, current_pos[1] + dy * i]
        end

        unless self.color == self.board[new_pos[0]][new_pos[1]].color
            moves_array << new_pos
        end

        moves_array
    end

    def moves
        # debugger
        moves_arr = []             #           DOWN / S
        move_dirs.each do |deltas| #deltas =  [1, 0]
            moves_arr += grow_unblocked_moves_in_dir(deltas[0], deltas[1])
        end
        moves_arr
        #RETURNS EVERY POSSIBLE MOVE OF THAT PIECE
    end
end

