# Given an n x n array, return the array elements arranged from outermost elements to the middle element,
# traveling clockwise.
#
#    array = [[1,2,3],
#             [4,5,6],
#             [7,8,9]]
# snail(array) #=> [1,2,3,6,9,8,7,4,5]
# For better understanding, please follow the numbers of the next array consecutively:
#   array = [[1,2,3],
#           [8,9,4],
#           [7,6,5]]
# snail(array) #=> [1,2,3,4,5,6,7,8,9]
# This image will illustrate things more clearly:
# NOTE: The idea is not sort the elements from the lowest value to the highest;
# the idea is to traverse the 2-d array in a clockwise snailshell pattern.
# NOTE 2: The 0x0 (empty matrix) is represented as en empty array inside an array [[]].

def snail(arr)
  result = []

  until arr.empty? do
    n = arr.size
    (n-1).times do
      result << arr.first[0]
      arr.first.shift
    end

    for i in 0...n
      result << arr[i].pop
    end

    (n-1).times { result << arr.last.pop }

    res = []
    for i in 0..n-1 do
      res << arr[i][0]
      arr[i].shift
    end
    result << res.reverse

    arr.reject!{|el| el.empty?}
  end

  return result.flatten.compact
end
