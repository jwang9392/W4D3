require_relative "slideable"
require_relative "piece"

class Bishop < Piece

    def move_dirs
        self.diagonal_dirs
    end

    include Slideable
end