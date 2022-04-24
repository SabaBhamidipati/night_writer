require_relative 'english_reader'

enghlishreader = EnglishReader.new(ARGV[0], ARGV[1])
# require "pry"; binding.pry

# go through lesson - use File.open? .read? do .write method
# test for 2 methods
# Hash
# Josh T stuff 

# file.read returns string of char of whole file, readlines returns array of strings, and you can convert each string into braille one character at at time  and return
# there's logic in out put to limit to 80 char using hash dictionary (Module - translator - assigns letters in eglish text to arratys of char that represent Braille)
# message txt comes in, code converts, and outputs in braille.txt file
#create english reader to convert to braille characters
# Iteration 3 convert braille reader to english reader
# call chomp everytime to convert x.first.chomp.length
#Create engish reader class
