=begin

Triangles

Write a program to determine whether a triangle is equilateral, isosceles, or 
scalene.

An equilateral triangle has all three sides the same length.  An isosceles triangle 
has exactly two sides of the same length.  A scalene triangle has all sides of different length.

Note: for a shape to be a triangle at all, all sides must be of length > 0 and the sum of 
the lengths of any two sides must be greater than the length of the third side. 

Input:
Three integers representing the length of the sides of a triangle

Output:
A string representing the type of triangle that is represented by the lengths given
as arguments

Rules:
Explicit
Equilateral: all equal (valid) lengths
Isosceles: exactly two sides of the same length
Scalene: all sides of different lengths
All sides must be of length > 0 and the sum of the lengths of any two sides must be 
greater than the length of the third side. 

Implicit:
The class should raise an ArgumentError if the criteria for a triangle are not met.

------------ P
Input:
Three integers representing the length of the sides of a triangle

Output:
A string representing the type of triangle that is represented by the lengths given
as arguments

Rules:
Explicit
Equilateral: all equal (valid) lengths
Isosceles: exactly two sides of the same length
Scalene: all sides of different lengths
All sides must be of length > 0 and the sum of the lengths of any two sides must be 
greater than the length of the third side. 

Implicit:
The class should raise an ArgumentError if the criteria for a triangle are not met.

------------ E
Data structure to verify valid sides via sum:
- sort an array containing the sides and check whether the smallest two sides are greater 
than the largets side when summed

-> [2, 4, 5] 2 + 4 > 5 ?


------------ D
class Triangle
  def initialize
  end

  def kind
  end

  def all_greater_than_zero?
  end

  def valid_sum_of_sides?
  end
end

------------ A
Triangle Class
1. Within 'initialize', initialize @sides to an array containing the integers passed 
in as arguments
  1a. raise an `ArgumentError` unless all_greater_than_zero? and 
  valid_sum_of_sides? evaluate as true (see below for their implementation)
2. Within `kind`, initialize `unique_sides` to the result of reducing `@sides` to just 
the unique values that exist within it
  2a. Check the value of `unique_sides` and return 'equilateral' if the value is 1, 
  'isosceles' if the value is 2, or 'scalene' otherwise

all_greater_than_zero?
1. Check whether any of the values in `@sides` equals 0, and return `false` if so

valid_sum_of_sides?
1. Sort `@sides` from smallest to biggest
2. Verify that the summed elements at index 0 and index 1 of the sorted `@sides` array 
are greater than the last element
------------ C
=end

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError, 'Invalid side entry' unless all_greater_than_zero? && valid_sum_of_sides?
  end

  def kind
    unique_sides = @sides.uniq.size
    case unique_sides
    when 1      then 'equilateral'
    when 2      then 'isosceles'
    else 
      'scalene'
    end
  end

  def all_greater_than_zero?
    @sides.none?(&:zero?)
  end

  def valid_sum_of_sides?
    sorted_sides = @sides.sort
    [sorted_sides[0], sorted_sides[1]].sum > sorted_sides[-1]
  end
end





