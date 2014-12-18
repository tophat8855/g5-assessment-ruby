# I have the author key pointing to an array of the hashes representing
# each poem attributed to them. I don't think that's supposed to be an
# array, so I need to figure out how to get that to disappear without
# messing everything up.

all_the_poems = File.join("**", "data", "**", "*.txt")

array_of_poems = []

Dir.glob(all_the_poems).each do |file|
  poem = IO.readlines(file)

  number_of_lines_in_file = IO.readlines(file).count

  number_of_lines_in_header = 2 # these are the title and author lines

  # this will count the number of empty lines in the file
  # number of empty lines = number of verses
  empty_line_counter = 0
  poem.each do |line|
    if line == "\n"
      empty_line_counter += 1
    end
  end

  poem_line_count = number_of_lines_in_file - number_of_lines_in_header - empty_line_counter

  poem_data_hash = { poem[1].gsub("\n","") => {poem[0].gsub("\n","") => {verses: empty_line_counter, lines: poem_line_count}}}

  array_of_poems << poem_data_hash
end

merge_hashes = array_of_poems.each_with_object({}) do |author, hash|
  key,value = author.shift
  (hash[key] ||= []) << value #this is where the unruly array is being made
end

puts merge_hashes
