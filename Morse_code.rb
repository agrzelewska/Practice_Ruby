# You have to write a simple Morse code decoder.
# The Morse code encodes every character as a sequence of "dots" and "dashes".
# For example, the letter A is coded as ·−, letter Q is coded as −−·−, and digit 1 is coded as ·−−−−.
# The Morse code is case-insensitive, traditionally capital letters are used.
# When the message is written in Morse code, a single space is used to separate the character codes
# and 3 spaces are used to separate words.

# NOTE: Extra spaces before or after the code have no meaning and should be ignored.

# Your task is to implement a function that would take the morse code as input and return a decoded
# human-readable string.

# For example:

# decodeMorse('.... . -.--   .--- ..- -.. .')
# #should return "HEY JUDE"

  MORSE_CODE = {
      "---." => "!", ".-..-." => "\"", "...-..-" => "$", ".----." => "'",
      "-.--." => "(", "-.--.-" => ")", ".-.-." => "+", "--..--" => ",",
      "-....-" => "-", ".-.-.-" => ".", "-..-." => "/", "-----" => "0",
      ".----" => "1", "..---" => "2", "...--" => "3", "....-" => "4", "....." => "5",
      "-...." => "6", "--..." => "7", "---.." => "8", "----." => "9", "---..." => ":",
      "-.-.-." => ";", "-...-" => "=", "..--.." => "?", ".--.-." => "@", ".-" => "A",
      "-..." => "B", "-.-." => "C", "-.." => "D", "." => "E", "..-." => "F",
      "--." => "G", "...." => "H", ".." => "I", ".---" => "J", "-.-" => "K",
      ".-.." => "L", "--" => "M", "-." => "N", "---" => "O", ".--." => "P",
      "--.-" => "Q", ".-." => "R", "..." => "S", "-" => "T", "..-" => "U",
      "...-" => "V", ".--" => "W", "-..-" => "X", "-.--" => "Y", "--.." => "Z",
      "..--.-" => "_",
  }

def decodeMorse(morseCode)
  morseCode.split("   ")
           .map { |word| word.split(" ")
           .map { |char| MORSE_CODE[char] }.join }
           .join(" ").strip
end

puts decodeMorse(".... . -.--   .--- ..- -.. .")