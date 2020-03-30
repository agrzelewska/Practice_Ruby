# Introduction
# Good one Shaggy! We all love to watch Scooby Doo, Shaggy Rogers, Fred Jones, Daphne Blake and
# Velma Dinkley solve the clues and figure out who was the villain.
# The story plot rarely differed from one episode to the next.
# Scooby and his team followed the clue then unmasked the villain at the end.
#
# Task
# Your task is to initially solve the clues and then use those clues to unmask the villain.
# You will be given a string of letters that you must manipulate in a way that the clues guide you.
# You must then output the villain.
#
# You will be given an Array of potential villains and you must only return the correct masked villain.
#
# Potential Villains for the example test cases
# `Black Knights, Puppet Master, Ghost Clowner, Witch Doctors, Waxed Phantom, Manor Phantom,
# Ghost Bigfoot, Haunted Horse, Davy Crockett, Captain Injun, Greens Gloobs, Ghostly Manor,
# Netty Crabbes, King Katazuma, Gators Ghouls, Headless Jack, Mambas Wambas, Medicines Man,
# Demon Sharker, Kelpy Monster, Gramps Vamper, Phantom Racer, Skeletons Men, Moon Monsters`
#
# There will be different villains for the main test cases!
#
# Clue 1: The first clue is in a 'house' on 'String Class' Avenue.

def scoobydoo(villian, villians)
  letters = ('a'..'z').to_a
  numbers = (0..25).to_a
  letters_to_numbers = letters.zip(numbers).to_h
  numbers_to_letters = numbers.zip(letters).to_h

  villians_downcase = villians.map { |v| v.downcase.delete(' ') }
  villians_hash = (villians_downcase).zip(villians).to_h

  s = villian.reverse.chars.rotate(5)
  new = []
  (0...s.size).each do |i|
    if i.even?
      new[i] = s[i]
    else
      num = (letters_to_numbers.fetch(s[i]) + 5) % 26
      new[i] = numbers_to_letters.fetch(num)
    end
  end

  villians_hash.fetch(new.join)

end
