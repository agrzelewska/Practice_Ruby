# For building the encrypted string:
# Take every 2nd char from the string, then the other chars, that are not every 2nd char,
# and concat them as new String. Do this n times!

# Examples:
# "This is a test!", 1 -> "hsi  etTi sats!"
# "This is a test!", 2 -> "hsi  etTi sats!" -> "s eT ashi tist!"

# Write two methods:
# def encrypt(text, n)
# def decrypt(encrypted_text, n)
# For both methods:
# If the input-string is null or empty return exactly this value!
# If n is <= 0 then return the input text.

def encrypt(text, n)
  return text if n <= 0
  encrypt(text.scan(/(.)(.)/).transpose.reverse.join, n-1)
end

def decrypt(encrypted_text, n)
  return encrypted_text if n <= 0
  size = encrypted_text.length/2
  text = encrypted_text.chars
  decrypt(text.drop(size).zip(text.take(size)).join, n-1)
end