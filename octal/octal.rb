#------ P
#Given an octal input string, return a decimal output.
#
#About Octal (base-8)
#
#Decimal is a base-10 system.  A number 233 in base 10 notation can be understood as a linear
#combination of powers of 10:
#  - the rightmost digit gets multiplied by 10^0 = 1
#  - the next digit gets multiplied by 10^1 = 10
#  - the digit after that gets multiplied by 10^2 = 100
#  - the digit after that gets multiplied by 10^3 = 1000
#  - ...
#  - the n*th* digit gets multiplied by 10^n-1
#  - all of these values are then summed
#
#Octal numbers are similar, but they use a base-8 system.  A number 233 in base 8 can be understood
#as a linear combination of powers of 8:
#  - the rightmost digit gets multiplied by 8^0 = 1
#  - the next digit gets multiplied by 8^1 = 8
#  - the digit after that gets multiplied by 8^2 = 64
#  - the digit after that gets multiplied by 8^3 = 612
#  - ...
#  - the n*th* digit gets multiplied by 8n-1
#  - all of these values are then summed
# 
# Rules
# Implicit:
# - only 0 - 7 are valid octal numbers
# - octal strings that include non octal numbers should return 0
#------ E
#see ocatl_test.rb
#
#Things to consider:
#- octal numbers are only 0 through 7
#- some inputs will include non-digits
#- any input that includes a non-octal number of a non-digit should return 0
#------ D
#class Octal
#  def initialize(str)
#  end
#
#  def to_decimal
#  end
#end
#------ A
# initialize(str)
# 1. check if the input string includes any non-octal numbers or any non-digit characters
#   1a. if so, initialize @octal_string to an empty string; if not, convert it to an integer, then 
#   back to a string, then reverse it (this should take care of leading zeros)
# 3. initialize and assign @decimal to 0
# 
# to_decimal
# 1. Create a range from 0 up to and not including the size of @octal_string and iterate over it, accessing 
# each value via 'i'
#   1a. re-assign @decimal to the return value of adding itself to the return value of multiplying the current 
#   value at index 'i' in @octal_string by 8 to the power of 'i'
# 2. return @decimal
#------ C
class Octal
  def initialize(str)
    @octal_string = str.match?(/[^0-7]/) ? '' : str.to_i.to_s.reverse
    @decimal = 0
  end

  def to_decimal
    (0...@octal_string.size).each do |i|
      @decimal += @octal_string[i].to_i * (8**i)
    end
    @decimal
  end
end
