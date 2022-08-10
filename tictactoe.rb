class TicTacToe
    attr_reader :player_one, :player_two
    def initialize(player_one, player_two)
       @player_one = player_one
       @player_two = player_two
   end  
end

newGame = TicTacToe.new("p1","p2")

p newGame.player_one