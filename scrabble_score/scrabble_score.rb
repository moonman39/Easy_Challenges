=begin
------ P
Given a word, compute the scrabble score for that word

Input:
a string

Output:
an integer representing the scrabble score of the input string

Rules
Implicit:
- non-strings or empty strings shoudl return 0
- case doesn't matter
- will need both an instance method and class method to calculate the score
------ E
See scrabble_score_test.rb
------ D
class Scrabble
  def initialize(word)
  end

  def score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

@tile_scores = {
  [a, e, i, o, u] => 1,
  [d, g] => 2,
  [b, c, m, p] => 3
  ...
}
------ A
initialize(word)
1. check whether word exists
  1a. if it does assign @word to `word` lowercased; if not, assign @word to an empty string
2. initialize @tile_scores to a hash with each key being an array of characters and its corresponding
value being its tile score value represented as an integer

score
1. initialize 'score' to 0
2. separate @word into individual characters in an array and iterate over it, accessing each value via 
'char'
  2a. initialize 'tile_score' to the result of selecting the key/value pair from @tile_scores for which 
  the key includes the current value of 'char', then accessing the first element from its values
  2b. increase 'score' by 'tile_score'
3. return 'score'

self.score
1. instantiate a new Scrabble object and invoke the score instance method
------ C
=end

class Scrabble
  def initialize(word)
    @word = word && !word.match?(/\W/) ? word.downcase : ''
    @tile_scores = {
      'aeoiulnrst' => 1,
      'dg' => 2,
      'bcmp' => 3,
      'fhvwy' => 4,
      'k' => 5,
      'jx' => 8,
      'qz' => 10
    }
  end

  def score
    score = 0
    @word.chars.each do |char|
      score += @tile_scores.select { |k,_| k.include?(char) }.values[0]
    end
    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end