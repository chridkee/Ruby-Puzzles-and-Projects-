require_relative "./board.rb" 
require_relative "./player.rb"
require_relative "./computer"


class Game 

    attr_reader :board 

    def initialize(p1_mark, com_mark)
        @p1 = Player.new(p1_mark)
        @p2 = Computer.new(com_mark)
        @current_player = @p1
        @board = Board.new
    end 
    
    def random_position
        positions = board.legal_positions
        return positions.sample
    end 

    def switch_turn
        if @current_player == @p1
            @current_player = @p2
        else 
            @current_player = @p1
        end 
    end 

    
    def play 
        
        while @board.empty_positions? == true 
            @board.print_grid
            if @current_player == @p1
                pos = @current_player.get_position
            else 
                p "------------------------"
                pos = self.random_position 
            end
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                p @current_player.mark.to_s + " player, YOU WIN!!!"
                return 
            else 
                switch_turn
            end 
        end 
        p "it's a draw :/" 
    end 
end 

Game.new(:X, :O).play

