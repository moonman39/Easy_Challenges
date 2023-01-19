=begin
------ P
Write a program that can generate lyrics of the 99 Bottles of beer song.

Input
one or more integers representing the verses in the beer song

Output
a string or strings representing the lyrics of the beer song corresponding with the input
integers

Rules
Implicit:
- if there is a gap in the 
------ E
see beer_song_test.rb
------ D
class BeerSong
  def initialize
  end

  def verse(verse_num)
    verse = ''
  end

  def verses(start, finish)
    verses = ''
  end

  def self.lyrics
    Beersong.new.verses(99, 0)
  end

  private

  def construct_verse(verse)
  end
end

@verse_info = {
  (2..99).to_a => { bottles: 'bottles', pass_verse: 'Take one down and pass it around, '},
  [1] => { bottles: '1 bottle', pass_verse: 'Take it down and pass it around, '},
  [0] => { bottles: 'No more bottles', pass_verse: 'Go to the store and buy some more, '},
}
------ A
initialize
1. initialize and assign @verse_info to a hash with its keys being different ranges of verse values and 
its values being a hash containing verse characteristics to be used in string interpolation
2. initialize and assign @part_one to the string section that mentions 

verse(verse_num)
1. initialize and assign `verse` to an empty string

verses(start, finish)
1. initialize and assign 'verses' to an empty string

verse(verse_num) && 
------ C
=end
class BeerSong
  def self.verse(verse_num)
    verse = construct_verse(verse_num)
  end

  def self.verses(start, finish)
    verses = []
    start.downto(finish) { |verse| verses << construct_verse(verse) }
    verses.join("\n")
  end

  def self.construct_verse(verse_num)
    case verse_num
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" +
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" +
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" +
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" +
      "Take one down and pass it around, #{verse_num - 1} bottles of beer on the wall.\n"
    end
  end

  def self.lyrics
    BeerSong.verses(99,0)
  end
end

