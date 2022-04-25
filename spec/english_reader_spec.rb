require './lib/english_reader'
# require './lib/night_writer'

RSpec.describe EnglishReader do

  before :each do
    @english_file_path = './spec/testing_txt_files/english_chars.txt'
    @braille_file_path = './spec/testing_txt_files/braille_chars.txt'
    @english_reader = EnglishReader.new(@english_file_path, @braille_file_path)
    @dictionary = Dictionary.new
  end

  it 'exists' do
    expect(@english_reader).to be_a(EnglishReader)
  end

  it 'counts characters in input text file' do
    expect(@english_reader.count_characters).to eq(6)
  end

  it 'prints welcome message' do
    expected = "Created './spec/testing_txt_files/braille_chars.txt' containing 6 characters"
    expect(@english_reader.welcome_message).to eq(expected)
  end

  it 'can separate text into elements of an array' do
    # require "pry"; binding.pry
    expect(@english_reader.input_to_array).to eq(['d', 'd', 'd', 'd', 'd', 'd'])
  end

  it 'can convert a text string to braille' do
    expected = ["00", ".0", ".."],["00", ".0", ".."],["00", ".0", ".."],["00", ".0", ".."], ["00", ".0", ".."], ["00", ".0", ".."]
    expect(@english_reader.convert_english).to eq(expected)
  end
end
