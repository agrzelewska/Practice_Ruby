# The action of a Caesar cipher is to replace each plaintext letter with a different one
# a fixed number of places up or down the alphabet.
#
# This program performs a variation of the Caesar shift.
# The shift increases by 1 for each character (on each iteration).
#
# If the shift is initially 1, the first character of the message to be encoded will be shifted by 1,
# the second character will be shifted by 2, etc...
#
# The function "movingShift" first codes the entire string and then returns
# an array of strings containing the coded string in 5 parts (five parts because,
# to avoid more risks, the coded message will be given to five runners, one piece for each runner).
#
# If possible the message will be equally divided by message length between the five runners.
# If this is not possible, parts 1 to 5 will have subsequently non-increasing lengths,
# such that parts 1 to 4 are at least as long as when evenly divided, but at most 1 longer.
# If the last part is the empty string this empty string must be shown in the resulting array.
#
# For example, if the coded message has a length of 17 the five parts will have lengths of
# 4, 4, 4, 4, 1. The parts 1, 2, 3, 4 are evenly split and the last part of length 1 is shorter.
# If the length is 16 the parts will be of lengths 4, 4, 4, 4, 0.
# Parts 1, 2, 3, 4 are evenly split and the fifth runner will stay at home since his part is the empty string.
# If the length is 11, equal parts would be of length 2.2, hence parts will be of lengths 3, 3, 3, 2, 0.
#
# You will also implement a "demovingShift" function.

ALPHABET =
    {"a"=>1, "b"=>2, "c"=>3, "d"=>4, "e"=>5, "f"=>6, "g"=>7, "h"=>8,
     "i"=>9, "j"=>10, "k"=>11, "l"=>12, "m"=>13, "n"=>14, "o"=>15, "p"=>16,
     "q"=>17, "r"=>18, "s"=>19, "t"=>20, "u"=>21, "v"=>22, "w"=>23, "x"=>24,
     "y"=>25, "z"=>26,
     "A"=>27, "B"=>28, "C"=>29, "D"=>30, "E"=>31, "F"=>32, "G"=>33, "H"=>34,
     "I"=>35, "J"=>36, "K"=>37, "L"=>38, "M"=>39, "N"=>40, "O"=>41, "P"=>42,
     "Q"=>43, "R"=>44, "S"=>45, "T"=>46, "U"=>47, "V"=>48, "W"=>49, "X"=>50,
     "Y"=>51, "Z"=>52}

class String
  def fetch_alphabet
    chars.map { |char| ALPHABET.has_key?(char) ? ALPHABET.fetch(char) : char }
  end
end

def movingShift(s, shift)

  array_encoded = []
  s.fetch_alphabet.each_with_index do |a, index|
    if a.is_a?(Integer)
      count = a + (index + shift)%52
      if a <= 26
        count%26 == 0 ? array_encoded << 26 : array_encoded << count%26
      else
        if count%52 == 0
          array_encoded << 52
        else
          count%52 > 26 ? array_encoded << count%52 : array_encoded << count%52+26
        end
      end
    else
      array_encoded << a
    end
  end

  array_final = []
  array_encoded.each do |char|
    ALPHABET.has_value?(char) ? array_final << ALPHABET.key(char) : array_final << char
  end

  group_size = (array_final.length.to_f/5).ceil
  final = []
  5.times { final << array_final.shift(group_size).join }

  return final
end

def demovingShift(arr, shift)
  array_decoded = []
  arr.join.fetch_alphabet.each_with_index do |a, index|
    if a.is_a?(Integer)
      count = a - (index + shift)%52
      if a <= 26
        count%26 == 0 ? array_decoded << 26 : array_decoded << count%26
      else
        if count%52 == 0
          array_decoded << 52
        elsif count%52 <= 26 && count%52 > 0
          array_decoded << count%52+26
        else
          array_decoded << count%52
        end
      end
    else
      array_decoded << a
    end
  end

  array_final = []
  array_decoded.each do |char|
    ALPHABET.has_value?(char) ? array_final << ALPHABET.key(char) : array_final << char
  end

  return array_final.join
end