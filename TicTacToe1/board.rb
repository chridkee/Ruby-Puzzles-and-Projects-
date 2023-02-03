class Board 

    def initialize
        @grid = Array.new(3) {Array.new(3) {'_'}}
    end 

    def print_grid
        @grid.each do |row|
            puts row.join(" ")
        end  
    end 

    def valid?(position)
        valid = (0..2).to_a
        position.each do |idx|
            if !valid.include?(idx)
                return false 
            end 
        end 
        return true 
    end 

    def empty?(position)
        if @grid[position[0]][position[1]] == '_'
            return true 
        else 
            return false 
        end 
    end 

    def place_mark(position, mark)
        if valid?(position) == false 
            raise "Position is not Valid"
            return 
        end 
        if empty?(position) == false 
            raise "Position is filled" 
            return 
        end 
        @grid[position[0]][position[1]] = mark 
    end 

    def win_row?(mark)
        @grid.each do |row|
            if row.all?(mark)
                return true
            end 
        end 
        return false 
    end 

    def win_col?(mark)
        col = 0 
        count = 0
        while col < 3  
            @grid.each do |row|
                count += 1 if row[col] == mark
            end 
            return true if count == 3 
            count = 0 
            col += 1 
        end 
        return false 
    end 

    def win_diag?(mark)
        col = 0 
        count = 0 

        @grid.each do |row|
            count += 1 if row[col] == mark 
            col += 1 
        end 
        return true if count == 3 

        count = 0 
        col = 2 

        @grid.each do |row|
            count += 1 if row[col] == mark 
            col -= 1 
        end 
        return true if count == 3 
    end 

    def win?(mark)
        if win_diag?(mark) || win_col?(mark) || win_row?(mark)
            return true 
        end
        return false 
    end 

    def empty_positions?
        count = 0 
        @grid.each do |row|
            count += 1 if !row.any?('_')
        end
        return false if count == 3 
        return true 
    end 

end 

# b = Board.new
# b.place_mark([0, 0], :X)
# b.place_mark([1, 1], :X)
# b.place_mark([2, 2], :X)
# b.print_grid
# p b.win?(:X)