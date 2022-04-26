require_relative 'dictionary'

class EnglishReader
  attr_reader :lines, :file, :braille_file_path, :dictionary

  def initialize(english_file_path, braille_file_path)
    @lines = File.readlines(english_file_path, chomp: true)
    @file = braille_file_path
    @dictionary = Dictionary.new
    @braille_file_path = write_file(braille_file_path)
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

  def write_file(braille_file_path)
    writer = File.open(braille_file_path, "w")
    writer.write join_rows
    writer.close #not tested yet!!
  end

  def input_to_array
    @lines.map { |line| line.chars }.flatten
  end

  # def wrap_lines
  #   wrapped_lines = []
  #   input_to_array.each_slice(40) do |row|
  #     wrapped_lines << row
  #   end
  #   wrapped_lines
  # end

  def convert_english
    arr2 = []
    input_to_array.each do |row| #change to wrap_lines if needed
      row.each do |letter|
        if @dictionary.english_to_braille.keys.include?(letter)
          arr2 << @dictionary.english_to_braille[letter]
        else
          arr2 << letter
        end
      end
    end
    arr2
  end

  def align_rows
    convert_english.transpose
  end

  def join_rows
    align_rows.map { |row| row.join("") }
  end

  # def wrap_lines
  #   new_rows = []
  #       join_rows.each_slice(80) do |row|
  #         # rows << row
  #         # a.join("\n")
  #       end
  # end
end
