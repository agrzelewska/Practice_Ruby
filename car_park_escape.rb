# Your task is to escape from the carpark using only the staircases provided to reach the exit.
# You may not jump over the edge of the levels (you’re not Superman!) and the exit is always
# on the far right of the ground floor.
# Rules
#    1. You are passed the carpark data as an argument into the function.
#    2. Free carparking spaces are represented by a 0
#    3. Staircases are represented by a 1
#    4. Your parking place (start position) is represented by a 2
#    5. The exit is always the far right element of the ground floor.
#    6. You must use the staircases to go down a level.
#    7. You will never start on a staircase.
#    8. The start level may be any level of the car park.
#    9. Each floor will have only one staircase apart from the ground floor which
#       will not have any staircases.

def escape(carpark)
  position_y = carpark.index { |row| row.index(2) }
  position_x = carpark[position_y].index(2)
  position_xy = [position_y, position_x]
  y = carpark.size - 1
  x = carpark[0].size - 1

  result = []

  for i in position_y...y do
    stairs = carpark[i].index(1)
    steps = position_xy[1] - stairs
    if steps == 0
      result << nil
    else
      steps == steps.abs ? (result << 'L' + steps.abs.to_s) : (result << 'R' + steps.abs.to_s)
    end
    position_xy = [i+1, carpark[i].index(1)]
    result << 'D1'
  end

  steps_ground_floor = y > 0 ? (carpark[y-1].index(1) - x) : (carpark[0].index(2) - x)

  case steps_ground_floor
  when 0
    result << nil
  when steps_ground_floor.abs
    result << 'L' + steps_ground_floor.abs.to_s
  else
    result << 'R' + steps_ground_floor.abs.to_s
  end

  result
      .compact
      .slice_when { |i,j| (i[0] != j[0]) }
      .to_a
      .map { |a| a.length == 1 ? a : "D" + a.length.to_s }
      .flatten
end
