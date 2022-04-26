require './lib/braille_reader'
require './lib/dictionary'

RSpec.describe BrailleReader do

  before :each do
    @english_file_path = './spec/testing_txt_files/englishtest_chars.txt'
    @braille_file_path = './spec/testing_txt_files/brailletest_chars.txt'
    @english_reader = EnglishReader.new(@english_file_path, @braille_file_path)
    @dictionary = Dictionary.new
    # require "pry"; binding.pry
  end

  it 'exists' do
    expect(@braille_reader).to be_a(BrailleReader)
  end

  it 'counts characters in input text file' do
    expect(@braille_reader.count_characters).to eq(18)
  end

  it 'prints welcome message' do
    expected = "Created './spec/testing_txt_files/braille_chars.txt' containing 18 characters"
    expect(@braille_reader.welcome_message).to eq(expected)
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
    dictionary = Dictionary.new

    expected = [["0.", "..", ".."], ["..", "..", ".."], ["0.", "0.", ".."], ["00", "..", ".."]]
    expect(english_reader.convert_english).to eq(expected)
  end #not writing to braille file

  it 'aligns rows to write to the braille file' do
    english_file_path = './spec/testing_txt_files/convert_english.txt'
    braille_file_path = './spec/testing_txt_files/write_braille.txt'
    english_reader = EnglishReader.new(english_file_path, braille_file_path)
    dictionary = Dictionary.new

    expected = [["0.", "..", "0.", "00"], ["..", "..", "0.", ".."], ["..", "..", "..", ".."]]
    expect(english_reader.align_rows).to eq(expected)
  end

  it 'joins rows to print braille characters in succession' do #update this test
    english_file_path = './spec/testing_txt_files/convert_english.txt'
    braille_file_path = './spec/testing_txt_files/write_braille.txt'
    english_reader = EnglishReader.new(english_file_path, braille_file_path)
    dictionary = Dictionary.new

    expected = "000000....0.0.00.0.0.0......0..0................"
    expect(english_reader.join_rows).to eq(expected)
  end

  xit 'can wrap braille lines at 80 characters' do #update this test
    expected = ["f", "j", "l", "k", "f", "j", "l", "k", "f", "j", "l", "k", "f",
      "j", "l", "w", "e", "k", "f", "j", "w", "l", "f", "j", "k", "f", "f", "f",
      "f", "f", " ", " ", " ", " ", "c", "c", "c", "v", "v", "v", "v", "v"]
    expect(@english_reader.wrap_lines).to eq(expected)
  end

end
# last cpl of testing_tests
# no test for write method
