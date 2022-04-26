require_relative 'dictionary'

class BrailleReader
  attr_reader :lines, :file, :english_file_path, :dictionary

  def initialize(braille_file_path, english_file_path)
    @lines = File.readlines(braille_file_path, chomp: true)
    @dictionary = Dictionary.new
    @file = english_file_path
    @english_file_path = write_file(english_file_path)
    welcome_message
  end

  def count_characters
    count = 0
      @lines.each do |line|
        count += line.length
      end
    count
  end

  def welcome_message
    p "Created '#{@file}' containing #{count_characters} characters"
  end

  def write_file(english_file_path)
    writer = File.open(english_file_path, "w")
    writer.write convert_braille
    writer.close
  end

  def input_to_array
    @lines.map { |line| line.scan(/.{1,2}/) }.transpose
  end

  def convert_braille
    arr2 = []
    input_to_array.each do |sub|
      arr2 << @dictionary.braille_to_english[sub]
    end
    arr2
  end
end
