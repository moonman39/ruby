# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string
# a-z = 97 - 122
# A-Z = 65 - 90


def caesar_cipher(string, shift_factor)
  array = string.chars
  shifted_array = array.map do |c|
    if c.between?("a", "z") == false && c.between?("A", "Z") == false
      c
    else
      c_shift(c, shift_factor)
    end
  end
  shifted_array.join
end

def c_shift(c, shift_factor)
  shift_factor.times do
    c = c.next[-1]
  end
  c
end




p caesar_cipher("What a string!", 104)


# def c_shift(c)
#   5.times do
#   c = c.next[-1]
#   p c
#    end
#   end