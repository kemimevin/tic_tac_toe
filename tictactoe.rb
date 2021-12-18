class TicTacToe
    WINNERS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
        ]
        

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    puts 'Enter Player 1 name'
    @player_1 = gets.chomp
    puts 'Enter Player 2 name'
    @player_2 = gets.chomp
    
    if @player_2 == @player_1
      puts 'You put the same name as Player 1! Unless you actually share the same name, please enter a different name.'
      @player_2 = gets.chomp
    end

    display_board
    first_turn
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts row_spacer = " - + - + - "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts row_spacer
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def index_player_input(player_input)
    player_input.to_i - 1
  end

  def place_player_marker(index, current_player)
    @board[index] = current_player
  end

  def space_free?(index)
    return true if @board[index].is_a? Numeric
  end

  def valid_move?(index)
    index.between?(0,8) && space_free?(index)
  end

  def first_turn   
    first_turn = rand(1..2)
    if first_turn == 1
        @first_turn = @player_1
        @second_turn = @player_2
    else
        @first_turn = @player_2
        @second_turn = @player_1
    end
    puts "#{@first_turn} goes first for this game. Pick a number (1-9) to start the game."
  end

  def turn_count
    turn = 0
    @board.each do |space|
      turn += 1 if space == "X" || space == "O"
    end
    return turn
  end

  def current_player_marker
    turn_number = turn_count
    if turn_number % 2 == 0
        player_marker = "X"
        @current_player = @first_turn
    else
        player_marker = "O"
        @current_player = @second_turn
    end
    return player_marker
    return @current_player
  end

  def turn  
    player_input = gets.chomp
    index = index_player_input(player_input)
    if valid_move?(index)
      player_marker = current_player_marker
      place_player_marker(index, player_marker)
      display_board
      puts "Please choose a number (1-9) for your turn."
    elsif !(index.between?(0,8))
        puts "Not a valid option."
    else
      puts "Space already taken. Pick another number."
      turn
    end
  end

  def three_in_a_row?
    WINNERS.each do |winning_line|
      first = winning_line[0]
      second = winning_line[1]
      third = winning_line[2]
  
      first_space = @board[first]
      second_space = @board[second]
      third_space = @board[third]
  
      if first_space == "X" && second_space == "X" && third_space == "X"
        return true
      elsif first_space == "O" && second_space == "O" && third_space == "O"
        return true
      end
    end
    return false
  end
  
  def draw?
    return true if @board.all? {|space| space == "X" || space == "O"}
  end

  def game_over?
    return true if three_in_a_row? || draw?
  end

  def play
    until game_over? == true
      turn
    end
  
    if three_in_a_row?
      puts "Congratulations #{@current_player}, you won!"
    else draw?
      puts "No more spaces left. This game is a draw."
    end
  end

end

new_game = TicTacToe.new
new_game.play
