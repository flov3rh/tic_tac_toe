class TicTacToe
  attr_accessor :board, :moves, :player_one, :player_two

  def initialize(players,main,board=[" ", " ", " ", " ", " ", " ", " ", " ", " "], moves=0)
    #Initialize our board and game
    @board = board
    @winner=false
    @moves=moves
    @player_one=players[0]
    @player_two=players[1]
    @turn=@player_one
    @main=main
  end

  def start
    until @winner
      #Players start playing
      move_peg(@main.player_in,@turn)
    end
  end

  def move_peg(move,player)
    #Player move
    case player
      when @player_one
        if @board[(move.to_i-1)] != "X" || @board[(move.to_i-1)] != "O"
          @moves+=1
          @board[(move.to_i-1)]="X"
          @turn=@player_two
        else
          @main.player_in("Invalid Choice")
        end
        system("clear")
      when @player_two
        if @board[(move.to_i-1)] != "X" || @board[(move.to_i-1)] != "O"
          @moves+=1
          @board[(move.to_i-1)]="O";
          @turn=@player_one
        else
          @main.player_in("Invalid Choice")
        end
        system("clear")
    end
    @winner=check_winner
    if @winner
      puts "game over"
    else
      @main.print_board
      @main.print_choice
    end
  end

  def check_winner
    #Game finishes after 9 moves
    # check for player X Win
    # if @board.each_cons(3).map(&:select)
    #   puts "Player X won!"
    #   true
    if (@board[0]=="X" && @board[1]=="X" && @board[2]=="X") ||
      (@board[3]=="X" && @board[4]=="X" && @board[5]=="X") ||
      (@board[6]=="X" && @board[7]=="X" && @board[8]=="X") ||
      (@board[0]=="X" && @board[3]=="X" && @board[6]=="X") ||
      (@board[1]=="X" && @board[4]=="X" && @board[7]=="X") ||
      (@board[2]=="X" && @board[5]=="X" && @board[8]=="X") ||
      (@board[0]=="X" && @board[4]=="X" && @board[8]=="X") ||
      (@board[2]=="X" && @board[4]=="X" && @board[6]=="X")
      @main.print_winner(@player_one)
      true
    elsif (@board[0]=="O" && @board[1]=="O" && @board[2]=="O") ||
      (@board[3]=="O" && @board[4]=="O" && @board[5]=="O") ||
      (@board[6]=="O" && @board[7]=="O" && @board[8]=="O") ||
      (@board[0]=="O" && @board[3]=="O" && @board[6]=="O") ||
      (@board[1]=="O" && @board[4]=="O" && @board[7]=="O") ||
      (@board[2]=="O" && @board[5]=="O" && @board[8]=="O") ||
      (@board[0]=="O" && @board[4]=="O" && @board[8]=="O") ||
      (@board[2]=="O" && @board[4]=="O" && @board[6]=="O")
      @main.print_winner(@player_two)
      true
    elsif @moves == 9
      @main.print_draw()
      true
    end
    # check for plaer O Win
  end

end
