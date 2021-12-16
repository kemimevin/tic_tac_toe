class TicTacToe
  def initialize
    puts 'Enter Player 1 name'
    @player1 = gets.chomp
    puts 'Enter Player 1 character'
    @player1char = gets.chomp
    puts 'Enter Player 2 name'
    @player2 = gets.chomp
      if @player2 == @player1
        puts 'Cannot enter the same name as Player 1! Please enter a different name.'
        @player2 = gets.chomp
      end
    puts 'Enter Player 2 character'
    @player2char = gets.chomp
      if @player2char == @player1char
        puts 'Cannot pick the same character as Player 1! Pick again.'
        @player2char = gets.chomp
      end        
  end

  # turn order
  def turn_order
    current_player = ''
    player_turn = rand(1..2)
    if player_turn == 1
        @current_player = @player1
    else
        @current_player = @player2
    end
    puts "#{@current_player} starts this game."
  end

  def board_display
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    row_spacer = '- + - + -'
    (0..2).each do |i|
      puts @board[i].join(' | ')
      puts row_spacer if i < 2
    end
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

  # draw condition
  def draw_condition
    
  end



  def play
    turn_order
    board_display
  end
end

  TicTacToe.new.play
