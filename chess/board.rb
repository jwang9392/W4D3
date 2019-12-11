require_relative "piece.rb"

class Board

    attr_reader :grid

    def initialize 
        @grid = Array.new(8){Array.new(8)}
        #@sentinel = NullPiece
    end

    def [](pos)
        self[pos.first][pos.last]
    end

    def []=(pos, value)
        self[pos.first][pos.last] = value
    end

# if no piece at start position
#  

# the piece cannot move to end
#  end_pos is not on grid == idx of row or col !(0..7)

    def move_piece(start_pos, end_pos)

        raise "No piece at this position" if grid[start_pos.first][start_pos.last] == nil 
        
        raise "The piece cannot move to this position" unless (0..7).include?(end_pos.first) && (0..7).include?(end_pos.last)

        piece = @grid[start_pos.first][start_pos.last]
        @grid[end_pos.first][end_pos.last] = piece
        @grid[start_pos.first][start_pos.last] = nil

        piece.pos = end_pos

    end

    def add_piece(piece, pos)
        @grid[pos.first][pos.last] = Piece.new(piece, pos)
    end

    def render
        @grid.each do |row|
            converted = row.map do |ele|
                if ele == nil
                    "_"
                else
                    ele.symbol
                end
            end

            p converted.join(" ")
        end
    end
end

if __FILE__ == $PROGRAM_NAME

    b = Board.new
    b.add_piece(:x, [0,0])
    b.add_piece(:v, [0,1])
    b.add_piece(:C, [5,7])
    b.render
puts " --"
    p b.grid[0][0]
puts " --"
    b.move_piece([0,0], [0,5])
    b.render
puts " --"
    p b.grid[0][5]

    # b.move_piece([0,5], [-1, 10])
    # b.move_piece([0,3], [1, 0])

end