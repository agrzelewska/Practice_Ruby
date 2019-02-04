# MORSE CODE DECODER
# The aim of this task is explained below

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
  morseCode.split('   ')
           .map { |word| word.split(' ')
           .map { |char| MORSE_CODE[char] }.join }
           .join(' ').strip
end

def decodeBits(bits)

  rate = bits.gsub!(/^0*|0*$/, '').scan(/1+|0+/).map(&:size).min

  bits.gsub('111' * rate, '-')
      .gsub('1' * rate, '.')
      .gsub('0000000' * rate, '   ')
      .gsub('000' * rate, ' ')
      .gsub('0' * rate, '')
  
  end


bits = '10101010001000111010111011100000001011101110111000101011100011101010001'
bits1 = '1100110011001100000011000000111111001100111111001111110000000000000011001111110011111100111111000000110011001111110000001111110011001100000011'
morseCode = '.... . -.--   .--- ..- -.. .'
puts decodeBits(bits1)
puts decodeMorse(decodeBits(bits1))
puts decodeMorse(morseCode)


# The Morse code encodes every character as a sequence of "dots" and "dashes".
# For example, the letter A is coded as ·−, letter Q is coded as −−·−, and digit 1 is coded as ·−−−−.
# The Morse code is case-insensitive, traditionally capital letters are used.
# When the message is written in Morse code, a single space is used to separate the character codes
# and 3 spaces are used to separate words.

# NOTE: Extra spaces before or after the code have no meaning and should be ignored.

# The second part (decodeBits) is a Morse code decoder for wired electrical telegraph.
# Electric telegraph is operated on a 2-wire line with a key that, when pressed,
# connects the wires together, which can be detected on a remote station.
# The Morse code encodes every character being transmitted as a sequence of "dots"
# (short presses on the key) and "dashes" (long presses on the key).

# When transmitting the Morse code, the international standard specifies that:

# "Dot" – is 1 time unit long.
# "Dash" – is 3 time units long.
# Pause between dots and dashes in a character – is 1 time unit long.
# Pause between characters inside a word – is 3 time units long.
# Pause between words – is 7 time units long.
# However, the standard does not specify how long that "time unit" is. And in fact different
# operators would transmit at different speed. An amateur person may need a few seconds to transmit
# a single character, a skilled professional can transmit 60 words per minute, and robotic transmitters
# may go way faster.

# For this task we assume the message receiving is performed automatically by the hardware that
# checks the line periodically, and if the line is connected (the key at the remote station is down),
# 1 is recorded, and if the line is not connected (remote key is up), 0 is recorded. After the message
# is fully received, it gets to you for decoding as a string containing only symbols 0 and 1.

# For example, the message HEY JUDE, that is ···· · −·−− ·−−− ··− −·· · may be received as follows:

# 1100110011001100000011000000111111001100111111001111110000000000000011001111110011111100111111000000
# 110011001111110000001111110011001100000011

# This transmission is perfectly accurate according to the standard, and the hardware sampled
# the line exactly two times per "dot".