require './lib/english_reader'
require 'spec helper'

RSpec.describe EnglishReader do
  
  before :each do
    @english_file_path = './spec/testing_txt_files/english_chars.txt'
    @braille_file_path = './spec/testing_txt_files/braille_chars.txt'
    @english_reader = EnglishReader.new(@english_file_path, @braille_file_path)
  end

  it 'exists' do
    expect(@english_reader).to be_a(EnglishReader)
  end #not printing file name in message for braille

  it 'counts characters in input text file' do
    expect(@english_reader.count_characters).to eq(6)
  end

  it 'prints welcome message' do
    expected = "Created './spec/testing_txt_files/braille_chars.txt' containing 6 characters"
    expect(@english_reader.welcome_message).to eq(expected)
  end #failing bc of

  it 'can make arrays of incoming text' do
    expected = ['d', 'd', 'd', 'd', 'd', 'd']
    require "pry"; binding.pry
    expect(@english_reader.incoming_text).to eq(expected)
  end
end
