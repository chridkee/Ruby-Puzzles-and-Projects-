

class Player 

    attr_reader :mark 

    def initialize(mark)
        @mark = mark
    end 

    def get_position 
        p "Player " + mark.to_s
        p "Enter your move as 'row#' space 'col#'"
        p "example: 0 1"

        move = gets.chomp 

        arr = move.split(" ")
        arr.map!{|ele| ele.to_i}

        if  arr.length != 2 || arr.all? {|ele| is_a?(Numeric)}
            raise ArgumentError "Position entered is not valid"
        end 

        return arr
    end 

end 

# Player.new(:X).get_position