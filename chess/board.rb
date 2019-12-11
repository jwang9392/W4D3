require_relative "./pieces/piece.rb"
require_relative "./pieces/knight.rb"

class Board

    attr_reader :grid

    def initialize 
        @grid = Array.new(8){Array.new(8)}
        #@sentinel = NullPiece
    end

    def [](pos)
        @grid[pos.first][pos.last]
    end

    def []=(pos, value)
        @grid[pos.first][pos.last] = value
    end

# if no piece at start position
#  must be a piece at start position

# the piece cannot move to end
#  end_pos is not on grid == idx of row or col !(0..7)

    def move_piece(start_pos, end_pos)

        raise "No piece at this position" if self[start_pos] == nil 
        
        raise "The piece cannot move to this position" unless (0..7).include?(end_pos.first) && (0..7).include?(end_pos.last) #make helper for the logic

        piece = self[start_pos] #@grid[start_pos.first][start_pos.last]
       self[end_pos] = piece
       self[start_pos] = nil

        piece.pos = end_pos

    end

    def add_piece(color, pos)
        self[pos] = Knight.new(color, @grid, pos)
        #@grid[pos.first][pos.last] = Piece.new(piece, pos)
        
    end

    def render
        p "  0 1 2 3 4 5 6 7"
        @grid.each_with_index do |row, i|
            converted = row.map do |ele|
                if ele == nil
                    "_"
                else
                    ele.color
                end
            end

            p i.to_s + " " + converted.join(" ")
        end
    end
end


if __FILE__ == $PROGRAM_NAME

    b = Board.new
    b.add_piece(:w, [4,3])
    b.add_piece(:b, [2,3])
    b.add_piece(:w, [7,3])
    b.add_piece(:b, [4,2])
    b.add_piece(:w, [4,6])
    b.add_piece(:w, [2,1])
    b.add_piece(:b, [2,5])
    b.add_piece(:w, [7,6])
    b.add_piece(:b, [6,1])
    b.add_piece(:w, [2,2])

    b.render
    p b.grid[4][3].moves
puts " --"

end