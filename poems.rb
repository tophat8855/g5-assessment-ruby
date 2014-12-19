all_the_poems = File.join("**", "data", "**", "*.txt")

hash_of_poems = {}
array_of_poems = []

Dir.glob(all_the_poems).each do |file|
  poem = IO.readlines(file)

  number_of_lines_in_file = IO.readlines(file).count

  number_of_lines_in_header = 2

  # this will count the number of empty lines in the file
  # number of empty lines = number of verses
  empty_line_counter = 0
  poem.each do |line|
    if line == "\n"
      empty_line_counter += 1
    end
  end

  poem_line_count = number_of_lines_in_file - number_of_lines_in_header - empty_line_counter

  author = poem[1].gsub("\n","")
  title = poem[0].gsub("\n","")
  authors = hash_of_poems.keys

  if authors.include?(author)
    hash_of_poems[author][title] = { verses: empty_line_counter, lines: poem_line_count }
  else
    hash_of_poems[author] = { title => { verses: empty_line_counter, lines: poem_line_count } }
  end

  hash_of_poems
end

puts hash_of_poems
