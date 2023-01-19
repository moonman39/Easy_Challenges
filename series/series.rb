=begin
------ P
Given a string of digits, return all the possible consecutive number series of a specified length 
in that string

Input
a string during instantiation and an integer representing the desired series size

Output
an array containing the consecutive number series of a specified length in the given 
string

Rules
Explicit:
- if the requested series length is larger than the input string, an error should
  be returned
------ E
see series_test.rb
------ D
class Series
  def initialize(str)
  end

  def slices(series_length)
  end
end
------ A
initialize(str)
1. initialize and assign @digits to the result of separating the input string into 
individual characters, placing them in an array, and transforming each character to 
an integer

slices(series_length)
1. raise an ArgumentError if series_length is larger than the size of @digits
2. return each consecutive series of digits specified by series_length and place 
in an array
------ C
=end
class Series
  def initialize(str)
    @digits = str.chars.map(&:to_i)
  end


  def slices(series_length)
    raise ArgumentError, "The desired series length cannot be larger than the" +
    " size of the input string" unless series_length <= @digits.length

    @digits.each_cons(series_length).to_a
  end
end