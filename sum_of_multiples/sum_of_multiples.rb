=begin
------ P
Write a program that, given a natural number and a set of one or more other numbers, can find 
the sum of all the multiples of the numbers in the set that are less than the first number.

If the set of numbers is not given, use a defaul set of 3 and 5

For instance, if we list all the natural numbers up to, but not including, 20, that are multiples 
of either 3 or 5, we get, 3, 5, 6, 9, 10, 12, 15, 18.  The sum of these multiples is 78

Input
a set of numbers (sometimes not given any) and a natural number

Output
an integer representing a sum of all the natural numbers from one up to and not including the given 
natural number that are multiples of the set of numbers (either one, don't have to be multiples of both)

Rules
Explicit:
- if a set of numbers is not given, use a default set of 3 and 5
------ E
see sum_of_multiples_test.rb
------ D
class Sum
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(number)
  end

  def self.to(number)
  end
------ A
initialize(*numbers)
1. check if numbers is empty;
  1a. if it is, assign @numbers to an array containing 3 and 5; if not, assign it to numbers

to(number)
1. create a range from 1 up to and not including number and iterate over it, accessing each value via 
'current_num' and selecting the values that are divisible by any value in @numbers, then sum 
the values of the resulting array

self.to(number)
1. instantiate a new Sum object and run the to instance method
------ C
=end

class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers.empty? ? [3, 5] : numbers
  end

  def to(natural_number)
    (1...natural_number).select do |current_num|
      @numbers.any? { |number| (current_num % number).zero? }
    end.sum
  end

  def self.to(number)
    SumOfMultiples.new.to(number)
  end
end
