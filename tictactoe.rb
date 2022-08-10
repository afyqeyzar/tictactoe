class TicTacToe
    attr_reader :player_one, :player_two
    def initialize
        print "Enter Player 1 Name: "
        @player_one = gets
        print "Enter Player 2 Name: "
        @player_two = gets
        @location_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end
    
   
    def display_board
        puts " #{@location_array[0]} | #{@location_array[1]} | #{@location_array[2]} "
        puts " -- --- --"
        puts " #{@location_array[3]} | #{@location_array[4]} | #{@location_array[5]} "
        puts " -- --- --"
        puts " #{@location_array[6]} | #{@location_array[7]} | #{@location_array[8]} "
    end
    
    def get_players
        puts @player_one, @player_two
    end
end

newGame = TicTacToe.new

#newGame.get_players3
newGame.display_board