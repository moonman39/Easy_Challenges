# frozen_string_literal: true

# ------ P
# Given an integer return whether the given integer is perfect, abundant, or deficient according to
# Nicomachus' classification scheme.
#
# The classification is based on comparison between the number and the sum of its positive divisors
# (numbers that can be evenly divided into the target number with no remainder) excluding the number
# itself.
#
# Rules
#
# Explicit:
# - perfect numbers have a divisor sum equal to the number itself
# - abundant numbers have a divisor sum greater than the number
# - deficient numbers have a divisor sum less than the number
# - prime numbers are always deficient since their only divisor is 1
#
# Implicit:
# - the program should raise a StandardError if the given integer is negative
# ------ E
# See perfect_number_test.rb
# ------ D
# class PerfectNumber
#   def classify(int)
#   end
# end
# ------ A
# classify(int)
# 1. verify that the argument is greater than 0, raise a Standard Error if not
# 2. initialize and assign 'divisors_sum' by doing the following:
#   2a. create a range from 1 up to and not including `int` and iterate over it, accessing each value
#   via 'num' and selecting those that are evenly divisible by 'int', then summing the resulting array
# 3. conditionally check the value returned by comparing 'divisors_sum' and 'int'
#   3a. when 'divisors_sum' is less than 'int', return 'deficient'
#   3b. when 'divisors_sum' is equal to 'int', return 'perfect'
#   3c. else return 'abundant'
# ------ C
class PerfectNumber
  def self.classify(int)
    raise StandardError, 'Must be a positive integer' unless int.positive?

    divisors_sum = (1...int).select { |num| (int % num).zero? }.sum

    case divisors_sum <=> int
    when -1    then 'deficient'
    when 0     then 'perfect'
    else
      'abundant'
    end
  end
end
