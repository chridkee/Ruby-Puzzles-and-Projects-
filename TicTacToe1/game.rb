require_relative "./board.rb" 
require_relative "./player.rb"

class Game 

    def initialize(p1_mark, p2_mark)
        @p1 = Player.new(p1_mark)
        @p2 = Player.new(p2_mark)
        @current_player = @p1
        @board = Board.new
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
            pos = @current_player.get_position
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

