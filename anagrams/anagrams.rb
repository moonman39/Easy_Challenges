=begin

----- P
Given a word and a list of possible anagrams, select the correct sublist that contains the
anagrams of the given word.

For example, given the word "listen" and a list of candidates "enlists", "google", "inlets", 
and "banana", the program should return a list containing "inlets".

Input:
a string and an array containing possible anagrams represented 

Output:
an array containing strings from the argument array that are anagrams of the string given 
as an argument 

Rules
Implicit:
- if no anagrams exist, return an empty array
- case doesn't matter
- identical words are not considered anagrams
----- E
See anagrams_test
----- D
class Anagram
  def initialize
  end

  def match
  end
end

'ant' ['tan', 'stand', 'at'] -> [a, n, t] [[a n t], [a d n s t], [a t]]
----- A
initialize(str, arr)
1. initialize and assign @word to 'str'

match(possible_anagrams)
1. initialize and assign 'sorted_word' to the result of downcasing and separating @word into 
individual characters and sorting it in alphabetical order in an array
2. iterate over possible_anagrams, accessing each value via 'str', and select those that meet the 
following criteria:
  2a. downcase and separate each iterated value of 'str' into individual characters and sorting it 
  in alphabetical order; check if this result is equal to 'sorted_word' and that the current iterated 
  value of `str` and `@word` are not equal (when both are lowercase)
----- C
=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(possible_anagrams)
    sorted_word = @word.downcase.chars.sort
    possible_anagrams.select do |str|
      str.downcase.chars.sort == sorted_word && 
      str.downcase != @word.downcase
    end
  end
end

anagram = Anagram.new('ant')
p anagram.match(%w(tan stand at))