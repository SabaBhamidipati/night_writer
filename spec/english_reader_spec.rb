require 'simplecov'
SimpleCov.start
require './lib/english_reader'
require './lib/dictionary'

RSpec.describe EnglishReader do

  before :each do
    @english_file_path = './spec/testing_txt_files/english_chars.txt'
    @braille_file_path = './spec/testing_txt_files/braille_chars.txt'
    @english_reader = EnglishReader.new(@english_file_path, @braille_file_path)
    @dictionary = Dictionary.new
    # require "pry"; binding.pry
  end

  it 'exists' do
    expect(@english_reader).to be_a(EnglishReader)
  end

  it 'counts characters in input text file' do
    expect(@english_reader.count_characters).to eq(42)
  end

  it 'prints welcome message' do
    expected = "Created './spec/testing_txt_files/braille_chars.txt' containing 42 characters"
    expect(@english_reader.welcome_message).to eq(expected)
  end

  it 'can separate text into elements of an array' do
    expected = ["f", "j", "l", "k", "f", "j", "l", "k", "f", "j", "l", "k", "f", "j",
      "l", "w", "e", "k", "f", "j", "w", "l", "f", "j", "k", "f", "f", "f", "f", "f",
      " ", " ", " ", " ", "c", "c", "c", "v", "v", "v", "v", "v"]
    expect(@english_reader.input_to_array).to eq(expected)
  end

  it 'can convert a text string to braille' do #need to come back and fix this test with correct expected
    english_file_path = './spec/testing_txt_files/convert_english.txt'
    braille_file_path = './spec/testing_txt_files/write_braille.txt'
    english_reader = EnglishReader.new(english_file_path, braille_file_path)

    expected = [["0.", "..", ".."], ["..", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]]
    expect(english_reader.convert_english).to eq(expected)
  end #not writing to braille file

  it 'aligns rows to write to the braille file' do
    english_file_path = './spec/testing_txt_files/convert_english.txt'
    braille_file_path = './spec/testing_txt_files/write_braille.txt'
    english_reader = EnglishReader.new(english_file_path, braille_file_path)

    expected = [["0.", "..", "0.", "00"], ["..", "..", "0.", ".."], ["..", "..", "..", ".."]]
    expect(english_reader.align_rows).to eq(expected)
  end

  it 'joins rows to print braille characters in succession' do
    english_file_path = './spec/testing_txt_files/convert_english.txt'
    braille_file_path = './spec/testing_txt_files/write_braille.txt'
    english_reader = EnglishReader.new(english_file_path, braille_file_path)

    expected = "0...0.00\n....0...\n........"
    expect(english_reader.join_rows).to eq(expected)
  end

  it 'can wrap braille lines at 80 characters' do
    english_file_path = './message.txt'
    braille_file_path = './braille.txt'
    english_reader = EnglishReader.new(english_file_path, braille_file_path)

    expected =
    "00.00.0.00.00.0.00.00.0.00.00..00.0.00.0.00.00.00.0000000000........0000000.0.0.\n0.000...0.000...0.000...0.000.00.0..0.00000.0.00..0.0.0.0.0...............0.0.0.\n....0.0.....0.0.....0.0.....0..0..0......00.....0.........................000000\n0.0.\n0.0.\n0000"
    expect(@english_reader.join_rows).to eq(expected)
  end
end
