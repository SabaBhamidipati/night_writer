require './lib/english_reader'

RSpec.describe EnglishReader do

  before :each do
    @english_file_path = './spec/testing_txt_files/english_chars.txt'
    @braille_file_path = './spec/testing_txt_files/braille_chars.txt'
    @english_reader = EnglishReader.new(@english_file_path, @braille_file_path)
  end

  it 'exists' do
    expect(@english_reader).to be_a(EnglishReader)
  end #not printing file name in message for braille 
end
