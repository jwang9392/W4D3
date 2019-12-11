require_relative "slideable"
require_relative "piece"

class Queen < Piece

    def move_dirs
        self.horizontal_dirs + self.diagonal_dirs
    end

    include Slideable
end