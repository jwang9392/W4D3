require_relative "slideable"
require_relative "piece"

class Rook < Piece

    def move_dirs
        self.horizontal_dirs
    end

    include Slideable
end