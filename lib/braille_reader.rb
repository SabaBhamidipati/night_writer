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
    writer.write join_rows
    writer.close #not tested yet!!
  end

  def input_to_array
    @lines.map { |line| line.chars }.flatten
  end

  def convert_braille
    arr2 = []
    input_to_array.each do |row| #change to wrap_lines if needed
      row.each do |letter| #this will be issue
        if @dictionary.braille_to_english.keys.include?(letter) #change based on row 39
          arr2 << @dictionary.braille_to_braille[letter] #change based on row 39
        else
          arr2 << letter #change
        end
      end
    end
    arr2
  end

  def align_rows
    convert_braille.transpose
  end

  def join_rows
    align_rows.map { |row| row.join("") }
  end
end
