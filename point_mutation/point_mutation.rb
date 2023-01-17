=begin

Write a program that can calculate the Hamming distance between two DNA strands.

The Hamming distance is only defined for sequences of equal length.  If you have two sequences 
of unequal length, you should compute the Hamming distance over the shorter length.

------- P
Given a string representing a DNA strand, return the number of character differences between another string given 
as a comparison string.

Input
Two strings

Output
An integer representing the number of characters that the two strings do not have in common

Rules
Explicit:
If the strings are of unequal length, only compare up to the length of the shorter string

------- E



------- D
class DNA
  def initialize
  end

  def hamming_distance

  end
end


------- A
1. In `initialize`
  1a. initialize and assign @dna1 to the string passed in as an argument
2. hamming_distance
  2a. initialize dna2 to the string passed in as an argument
  2b. initialize 'hamming_distance_val' to 0
  2b. Initialize 'shorter_dna' to the result of placing @dna1 and dna2 in an array and sorting the array by string
  size, then selecting the element at index 0 of that array
  2c. Create a range from 0 up to the length of `shorter_dna` - 1 and iterate over it, accessing each iterated 
  value via 'idx'
    - Increment `hamming_distance_val` by 1 if the characters at index `idx` of `@dna1` and `dna2` are unequal
  2d. Return `hamming_distance_val`


------- C
=end

class DNA
  def initialize(str)
    @dna1 = str
  end

  def hamming_distance(dna2)
    shorter_dna = [@dna1, dna2].sort_by(&:size)[0]
    (0...shorter_dna.size).count { |idx| @dna1[idx] != dna2[idx] }
  end
end

