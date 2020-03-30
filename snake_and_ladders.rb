# Your task is to make a simple class called SnakesLadders. The test cases will call the method play(die1, die2)
# independantly of the state of the game or the player turn. The variables die1 and die2 are the die thrown
# in a turn and are both integers between 1 and 6. The player will move the sum of die1 and die2.
#
# Rules
# 	1.  There are two players and both start off the board on square 0.
#   2.  Player 1 starts and alternates with player 2.
#   3.  You follow the numbers up the board in order 1=>100
#   4.  If the value of both die are the same then that player will have another go.
#   5.  Climb up ladders. The ladders on the game board allow you to move upwards and get ahead faster.
#       If you land exactly on a square that shows an image of the bottom of a ladder, then you may move
#       the player all the way up to the square at the top of the ladder. (even if you roll a double).
#   6.  Slide down snakes. Snakes move you back on the board because you have to slide down them.
#       If you land exactly at the top of a snake, slide move the player all the way to the square
#       at the bottom of the snake or chute. (even if you roll a double).
#   7.  Land exactly on the last square to win. The first person to reach the highest square on the board wins.
#       But there's a twist! If you roll too high, your player "bounces" off the last square and moves back.
#       You can only win by rolling the exact number needed to land on the last square. For example,
#       if you are on square 98 and roll a five, move your game piece to 100 (two moves), then "bounce" back
#       to 99, 98, 97 (three, four then five moves.)
# Returns
# 	Return Player n Wins!. Where n is winning player that has landed on square 100 without any remainding moves left.
#   Return Game over! if a player has won and another player tries to play.
#   Otherwise return Player n is on square x. Where n is the current player and x is the sqaure they are currently on.
#
class SnakesLadders
  attr_accessor :start_point_1, :start_point_2, :current_player
  attr_reader :player1, :player2

  def initialize(start_point_1=0, start_point_2=0, player1='Player 1', player2='Player 2')
    @start_point_1 = start_point_1
    @start_point_2 = start_point_2
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def play(die1, die2)
    return 'Game over!' if (start_point_1 == 100) || (start_point_2 == 100)
    @die1 = die1
    @die2 = die2
    return result(current_player, position)
  end

  private

  def position
    current_player == player1 ? start_point = start_point_1 : start_point = start_point_2

    end_point = start_point + @die1 + @die2
    end_point = 200 - end_point if end_point > 100

    case end_point
    when 2
      end_point = 38
    when 7
      end_point = 14
    when 8
      end_point = 31
    when 15
      end_point = 26
    when 16
      end_point = 6
    when 21
      end_point = 42
    when 28
      end_point = 84
    when 36
      end_point = 44
    when 46
      end_point = 25
    when 49
      end_point = 11
    when 51
      end_point = 67
    when 62
      end_point = 19
    when 64
      end_point = 60
    when 71
      end_point = 91
    when 74
      end_point = 53
    when 78
      end_point = 98
    when 87
      end_point = 94
    when 89
      end_point = 68
    when 92
      end_point = 88
    when 95
      end_point = 75
    when 99
      end_point = 80
    else
      end_point
    end

    current_player == player1 ? @start_point_1 = end_point : @start_point_2 = end_point
    change_current_player unless @die1 == @die2

    return end_point
  end

  def result(player, position)
    case position
    when 100
      "#{player} Wins!"
    else
      "#{player} is on square #{position}"
    end
  end

  def change_current_player
    @current_player == player1 ? @current_player = player2 : @current_player = player1
  end
end