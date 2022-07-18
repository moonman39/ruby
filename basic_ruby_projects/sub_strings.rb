# Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) 
# as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string 
# and how many times it was found.

# Next, make sure your method can handle multiple words

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  string_array = string.downcase.split
  result = Hash.new(0)
  string_array.each do |word|
    dictionary.each do |dictionary_word|
      if word.include?(dictionary_word)
        result[dictionary_word] += 1
      end
    end
  end
  result
end

puts substrings("igloo", dictionary)

