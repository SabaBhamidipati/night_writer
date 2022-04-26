require 'simplecov'
SimpleCov.start
require './lib/braille_reader'
require './lib/dictionary'

RSpec.describe BrailleReader do

  before :each do
    @english_file_path = './spec/testing_txt_files/englishtest_chars.txt'
    @braille_file_path = './spec/testing_txt_files/brailletest_chars.txt'
    @braille_reader = BrailleReader.new(@braille_file_path, @english_file_path)
    @dictionary = Dictionary.new
  end

  it 'exists' do
    expect(@braille_reader).to be_a(BrailleReader)
  end

  it 'counts characters in input text file' do
    expect(@braille_reader.count_characters).to eq(18)
  end

  it 'prints welcome message' do
    expected = "Created './spec/testing_txt_files/englishtest_chars.txt' containing 18 characters"
    expect(@braille_reader.welcome_message).to eq(expected)
  end

  it 'can separate braille characters into original sub-arrays for lookup' do
    expected = [["00", "0.", ".."], [".0", "00", ".."], ["0.", "0.", "0."]]
    expect(@braille_reader.input_to_array).to eq(expected)
  end

  it 'can convert braille characters to english' do
    expected = ["f", "j", "l"]
    expect(@braille_reader.convert_braille).to eq(expected)
  end
end
