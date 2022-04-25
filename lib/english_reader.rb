require './lib/dictionary'

class EnglishReader
  attr_reader :lines, :file, :braille_file_path, :dictionary

  def initialize(english_file_path, braille_file_path)
    @lines = File.readlines(english_file_path, chomp: true)
    @file = braille_file_path
    @braille_file_path = write_file(braille_file_path)
    @dictionary = Dictionary.new
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
    writer.write(@lines)
    writer.close
  end

  def input_to_array
    @lines.first.split('')
#won't work for files where there are more than 1 line and more than 1 array
  end
end
