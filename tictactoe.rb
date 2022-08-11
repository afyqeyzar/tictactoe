class TicTacToe
    attr_reader :player_one, :player_two
    def initialize
        #print "Enter Player 1 Name: "
        @player_one = "raeyn"
        #print "Enter Player 2 Name: "
        @player_two = "amir"
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

    def get_choice_for_p1
        print "#{@player_one} enter desired location: "
        sleep(1)
        @p1_location = gets.to_i
    end

    def get_choice_for_p2
        print "#{@player_two} enter desired location: "
        @p2_location = gets.to_i
    end
    
    def change_square_for_p1
        if @location_array[@p1_location - 1] == "O" or @location_array[@p1_location - 1] == "X"
            puts "that square is occipied"
            sleep(1)
            get_choice_for_p1()
            sleep(2)
            change_square_for_p1()
        else
            @location_array[@p1_location - 1] = "X"
            display_board()
        end
    end

    def change_square_for_p2
        if @location_array[@p2_location - 1] == "O" or @location_array[@p2_location - 1] == "X"
            puts "that square is occipied"
            sleep(1)
            get_choice_for_p2()
            sleep(2)
            change_square_for_p2()
        else
            @location_array[@p2_location - 1] = "O"
            display_board()
        end
    end

    def player_one_turn
        get_choice_for_p1()
        change_square_for_p1()
    end

    def player_two_turn
        get_choice_for_p2()
        change_square_for_p2()
    end
end

def all_equal?(arr)
    arr.uniq.size <= 1
end

newGame = TicTacToe.new

#newGame.get_players3
newGame.display_board
newGame.get_choice_for_p1
newGame.change_square_for_p1
newGame.get_choice_for_p2
newGame.change_square_for_p2


#syntax to use exit sleep