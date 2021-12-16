class TicTacToe
    def initialize
      puts 'Enter Player 1 name'
      @player1 = gets.chomp
      puts 'Enter Player 1 character'
      @player1char = gets.chomp
      puts 'Enter Player 2 name'
      @player2 = gets.chomp
      puts 'Enter Player 2 character'
      @player2char = gets.chomp
    end
  
    def win_conditions
      win_conditions = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9],
        [1, 5, 9],
        [3, 5, 7]
      ]
    end
  
    # # draw condition
    # def draw_condition
  
    # end
  
    # # turn order
    # def turn_order
  
    # end
  
    # board
    def board_display
  
    end
  
    # def play
    #     board_display
    # end
  end
  