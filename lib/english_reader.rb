class EnglishReader
attr_reader :lines, :braille_file_path

  def initialize(english_file_path, braille_file_path)
    @lines = File.readlines(english_file_path, chomp: true)
    @braille_file_path = write_file(braille_file_path)
    welcome_message
  end

  #example text file 1 contains 15 characters, rspec test should initialize new english reader and pass it the file path of text file to be read and the file path of where it writes

# then write write method to populate new text file

# text file > runner file > reader class > convert and write > to text file
  def count_characters
    count = 0
    @lines.each do |line|
    # require "pry"; binding.pry
      count += line.length
    end
    count
  end

  def welcome_message
    puts "Created '#{ARGV[1]}' containing #{count_characters} characters"
  end

  def write_file(braille_file_path)
    writer = File.open(braille_file_path, "w")
    writer.write(@lines) #not writing lines to braille file
    writer.close
  end
end
