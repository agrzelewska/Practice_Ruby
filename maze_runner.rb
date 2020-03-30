# You will be given a 2D array of the maze and an array of directions.
# Your task is to follow the directions given.
# If you reach the end point before all your moves have gone, you should return Finish.
# If you hit any walls or go outside the maze border, you should return Dead.
# If you find yourself still in the maze after using all the moves, you should return Lost.
#
# The Maze array will look like
# maze = [[1,1,1,1,1,1,1],
#        [1,0,0,0,0,0,3],
#        [1,0,1,0,1,0,1],
#        [0,0,1,0,0,0,1],
#        [1,0,1,0,1,0,1],
#        [1,0,0,0,0,0,1],
#        [1,2,1,0,1,0,1]]
# ..with the following key
#
# 0 = Safe place to walk
# 1 = Wall
# 2 = Start Point
# 3 = Finish Point
#
# direction = ["N","N","N","N","N","E","E","E","E","E"] == "Finish"
# Rules
# 1. The Maze array will always be square i.e. N x N but its size and content will alter from test to test.
# 2. The start and finish positions will change for the final tests.
# 3. The directions array will always be in upper case and will be
# in the format of N = North, E = East, W = West and S = South.
#
def maze_runner(maze, directions)
  i1 = maze.index { |line| line.index(2) }
  i2 = maze[i1].index(2)

  directions.each do |step|
    i1 = i1-1 if step == 'N'
    i1 = i1+1 if step == 'S'
    i2 = i2+1 if step =='E'
    i2 = i2-1 if step =='W'
    if !maze[i1] || maze[i1][i2] == 1
      return 'Dead'
    elsif maze[i1][i2] == 3
      return 'Finish'
    end
  end
  return 'Lost'
end