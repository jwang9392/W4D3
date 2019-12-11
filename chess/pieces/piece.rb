class Piece
    attr_reader 
    attr_accessor :pos, :color, :board

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end



end