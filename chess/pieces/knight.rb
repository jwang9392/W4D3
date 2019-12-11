require_relative "stepable"
require_relative "piece"

class Knight < Piece

    def move_diffs
        [
        [2, 1], 
        [2, -1], 
        [-2, 1], 
        [-2, -1], 
        [1, 2], 
        [1, -2], 
        [-1, 2], 
        [-1, -2]
        ]
    end

    include Stepable
end