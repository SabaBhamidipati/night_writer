require './lib/dictionary'

class EnglishReader
  attr_reader :lines, :file, :braille_file_path, :dictionary

  def initialize(english_file_path, braille_file_path)
    @lines = File.readlines(english_file_path, chomp: true)
    @file = braille_file_path
    @braille_file_path = write_file(braille_file_path)
    @dictionary = Dictionary.new
    @arr  = []
    welcome_message
  end

  def count_characters
    count = 0
    @lines.each do |line|
    # require "pry"; binding.pry
      count += line.length
    end
    count
  end

  def welcome_message
    p "Created '#{@file}' containing #{count_characters} characters"
  end

  def write_file(braille_file_path)
    writer = File.open(braille_file_path, "w")
    writer.write(@arr) #convert_english should go here but doesn't work
    writer.close
  end

  def input_to_array
    # require "pry"; binding.pry
    @lines.map { |line| line.chars}.flatten
  end

  def convert_english
    # arr = []
    input_to_array.find_all do |letter|
        @dictionary.english_to_braille.keys.each do |key|
          if letter == key
          @arr << @dictionary.english_to_braille[key]
          end
        end
    end
    # require "pry"; binding.pry
    @arr
  end

  def align_rows
    convert_english.transpose
  end
end
