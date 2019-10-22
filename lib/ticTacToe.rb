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
    @moves==9
  end

end
