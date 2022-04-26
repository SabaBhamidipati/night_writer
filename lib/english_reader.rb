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

  def convert_braille
    input_to_array.each do |letter|
      require "pry"; binding.pry
        if @dictionary.english_to_braille.keys.include?(letter)
          arr2 << @dictionary.english_to_braille[letter]
        end
    end
    arr2
  end

  def align_rows
    convert_english.transpose
  end

  def join_rows
    a = align_rows.map { |row| row.join("") }
    b = a.map { |line| line.scan(/.{1,80}/) }
    b.transpose.flatten.join("\n")
  end
end
