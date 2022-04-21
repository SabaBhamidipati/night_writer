class EnglishReader

  def initialize(english_file_path, braille_file_path)
    @lines = File.readlines(english_file_path)
    @braille_file_path = braille_file_path
    welcome_message
    #use braille_file_path later for method that uses file class and writes to a file
  end

  #create mocks for text files for testing / create text files folder in spec folder and run methods on those files as tests and create expected values in expect statement
  #example text file 1 contains 15 characters, rspec test should initialize new english reader and pass it the file path of text file to be read and the file path of where it writes
  def count_characters
    count = 0
    @lines.each do |line|
    # require "pry"; binding.pry
      count += line.chomp.length
    end
    count
  end

  def welcome_message
    puts "Created #{ARGV[1]} containing #{count_characters} characters"
  end
end
