#
# ------- P
# Write some code that converts modern decimal numbers into their Roman number equivalents.
#
# Given an integer return a string that represents the argument integer in Roman numerals
#
# Input
# An integer
#
# Output
# A string representing the input integer in Roman Numerals
#
# ------- E
# 1000=M
# 900=CM
# 90=XC
# 2000=MM
# 8=VIII
#
# ------- D
# @numerals = %w(1 5 9 10 40 50 90 100 400 500 1000).zip(%w(I V IX X XL L XC C CD D M)).to_h
#
# class RomanNumeral
#   def initialize(int)
#   end
#
#   def to_roman
#   end
# ------- A
# initialize(int)
# 1. initialize @numerals to a hash with different integer values as keys and their corresponding roman
# numeral as values
# 2. initialize @roman_numeral to an empty string
# 3. initialize @string_digit to the result of converting `int` to a string and reversing it
# 4. initialize @place to 1
#
# to_roman
# 1. iterate over @string_digit and access each value via 'char'
#   1a. initialize current_numeral to an empty string
#   1b. initialize digit to the integer version of `char`
#   1c. skip the current iteration if digit is zero
#   1d. check if digit  is 4, 5 or 9
#     - if it is reassign current_numeral to the value corresponding to the return value of
#       digit multiplied by the current value of @place in @numerals
#     - if it isnt reassign current_numeral to the result of multiplying the current value of digit
#       by the value corresponding to @place in @numerals
#   1e. check if any conversions are needed for edge_cases
#   1f. prepend current_numeral to @roman_numeral
#   1g. re-assign @place to itself times 10
# 2. return @roman_numeral
#
# check_edge_case(current_numeral)
# 1. if current_numeral has five of either I, X, or C at the beginning of the string
#   1a. if it does destructively replace the first five characters with the value corresponding
#   to the current value of @place multiplied by 5
# ------- C
class RomanNumeral
  def initialize(int)
    @numerals = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000].zip(%w[I IV V IX X XL L XC C CD D CM M]).to_h
    @roman_numeral = ''
    @string_digit = int.to_s.reverse
    @place = 1
    @edge_cases = [4, 5, 9]
  end

  def to_roman
    @string_digit.each_char do |char|
      digit = char.to_i
      current_numeral = @edge_cases.include?(digit) ? @numerals[@place * digit] : (@numerals[@place] * digit)
      convert_if_needed(current_numeral)
      @roman_numeral.prepend(current_numeral)
      @place *= 10
    end
    @roman_numeral
  end

  def convert_if_needed(current_numeral)
    current_numeral.gsub!(/^[IXC]{5}/, @numerals[@place * 5].to_s )
  end
end
