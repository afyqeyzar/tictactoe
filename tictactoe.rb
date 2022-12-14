class TicTacToe
    attr_reader :player_one, :player_two
    CHECK_HASH = {
        row_123: [],
        row_456: [],
        row_789: [],
        col_147: [],
        col_258: [],
        col_369: [],
        dia_159: [],
        dia_357: []
    }

    def initialize
        print "Enter Player 1 Name: "
        @player_one = gets.chomp
        sleep(1.5)
        print "Enter Player 2 Name: "
        @player_two = gets.chomp
        sleep(1.5)
        @location_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def get_check_hash
        CHECK_HASH
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
            sleep(1)
            change_square_for_p1()
        else
            @location_array[@p1_location - 1] = "X"
            sleep(1)
            display_board()
            check_for_winner(@p1_location, "X")
        end
    end

    def change_square_for_p2
        if @location_array[@p2_location - 1] == "O" or @location_array[@p2_location - 1] == "X"
            puts "that square is occipied"
            sleep(1)
            get_choice_for_p2()
            sleep(1)
            change_square_for_p2()
        else
            @location_array[@p2_location - 1] = "O"
            sleep(1)
            display_board()
            check_for_winner(@p2_location, "O")
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

    
    def check_for_winner(num, symbol)
        if num == 1
            CHECK_HASH[:row_123] << symbol
            CHECK_HASH[:col_147] << symbol
            CHECK_HASH[:dia_159] << symbol
        elsif num == 2
            CHECK_HASH[:row_123] << symbol
            CHECK_HASH[:col_258] << symbol
        elsif num == 3
            CHECK_HASH[:row_123] << symbol
            CHECK_HASH[:col_369] << symbol
            CHECK_HASH[:dia_357] << symbol
        elsif num == 4
            CHECK_HASH[:row_456] << symbol
            CHECK_HASH[:col_147] << symbol
        elsif num == 5
            CHECK_HASH[:row_456] << symbol
            CHECK_HASH[:col_258] << symbol
            CHECK_HASH[:dia_357] << symbol
            CHECK_HASH[:dia_159] << symbol
        elsif num == 6
            CHECK_HASH[:row_456] << symbol
            CHECK_HASH[:col_369] << symbol
        elsif num == 7
            CHECK_HASH[:row_789] << symbol
            CHECK_HASH[:col_147] << symbol
            CHECK_HASH[:dia_357] << symbol
        elsif num == 8
            CHECK_HASH[:row_789] << symbol
            CHECK_HASH[:col_258] << symbol
        else
            CHECK_HASH[:row_789] << symbol
            CHECK_HASH[:col_369] << symbol
            CHECK_HASH[:dia_159] << symbol
        end
    end
end

def play_full_round()
    newGame = TicTacToe.new
    newGame.display_board
    
    win = false
    winning_array = nil
    5.times do |i|
        
        
        newGame.player_one_turn
        newGame.get_check_hash.each do |position, collection|
            if collection.uniq.size == 1 && collection.length == 3
                win = true
                winning_array = collection
            else
                next
            end
        end
        
        if win == true
            break
        elsif i == 4
            break
        end

        newGame.player_two_turn

        newGame.get_check_hash.each do |position, collection|
            if collection.uniq.size == 1 && collection.length == 3
                win = true
                winning_array = collection
            else
                next
            end
        end

        if win == true
            break
        end
        


    end
    


    
    if winning_array == nil
        p "its a tie :/"
    elsif winning_array.include?("X")
        p "#{newGame.player_one} has won"
    else
        p "#{newGame.player_two} has won"
    end
    
end



play_full_round()