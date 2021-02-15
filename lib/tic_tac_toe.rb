class TicTacToe
    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],   
    [2, 4, 6]
]

    def initialize()
        @board = [" ", " "," ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        if "X" == @board[index] || "O" == @board[index]
            return true
        else
            false
        end
    end

    def valid_move?(index)
        if index <= 8 && index >= 0 && !position_taken?(index)
            return true
        else
            return false
        end
    end

    def turn
        while true
            # ask for input
            puts "Enter a number between 1 - 9"
            # get input
            user_input = gets.chomp
            # translate input into index
            index = input_to_index(user_input)
            # if index is valid
            if valid_move?(index)
                # make the move for index
                move(index, current_player)
                # show the board
                display_board

                break # stop looping
            else
                # do nothing -> just loop again
            end
        end
    end

    def turn_count
        # Given a board

        # start the counter
        # loop through the board:
            # each time a letter is placed, add to count + 1
        # return counter

        counter = 0
        @board.each do |letter|
            if letter == "X" || letter == "O"
                counter += 1
            end
        end
        return counter
    end

    def current_player
        if turn_count % 2 == 1
            return "O"
        elsif turn_count % 2 == 0
            return "X"
        end
    end
        # if turn_count % 2 = 1
        #   it's "O" turn
        # else if % 2 = 0 
        #   it's "X" turn

     # loop through the winning combinations
     # set first_letter to item in board at first index in combination (ex. 0)
            # set second_letter to item in board at second comb index (ex. 1)
            # set third_letter to item in board at thrid comb index (ex. 2)

            # if first_letter is same as second_letter and third_letter
                # return the combination (because someone won)
               
        # if we've looped through all the combinations then return false    
    def won?
        WIN_COMBINATIONS.each do |combo|
            first_letter = @board[combo[0]]
            second_letter = @board[combo[1]]  
            third_letter = @board[combo[2]]
            
            if first_letter == second_letter && first_letter == third_letter && first_letter != " "
                return combo
            end
        end

        return false
    end

    def full?
        if !@board.include? " "
            return true
        else
            return false
        end
    end
        # @board does not include spaces
        # return true
        #else
        #return false
    

    def draw?
        if !won? && full?
            return true
          elsif !full? && !won?
            return false
          else won?
            return false
       end
    end
        # if the board is full and if the score no one has won
            # return true for a draw
        # else false if neither has won on a full board
    
       

    def over?
        if draw? || won? || full?
            return true
        else
            return false
        end
    end
        # if the board is full/tie game or the game is won
        # return true
    

    def winner
        if won?
            return @board[won?[0]]
        else
            return nil
        end
    end
        # if X wins
        #   return X
        # if O wins
        #   return O
    

    def play
        # until the game is over
        until over?
        #     take turns
            turn
        end
          
        #   if the game was won
        if won?
        #     congratulate the winner
        puts "Congratulations #{winner}!"
        #   else if the game was a draw
        elsif draw?
        #     tell the players it ended in a draw
        puts "Cat's Game!"
        end 
          
    end

end

