require_relative "stepable"
require_relative "piece"

class King < Piece

    def move_diffs
        [ 
        [-1, 0], 
        [1, 0], 
        [0, -1], 
        [0, 1], 
        [-1, 1], 
        [-1, 1], 
        [1, 1], 
        [1, -1] 
        ]
    end

    include Stepable
end