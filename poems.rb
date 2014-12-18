# go through each file
# parse them by lines (look up how to parse .txt file)
# make a hash
# second line is key to hash
# first line (aka title) is value of the second and is key to hash that
# points to hash of verse and line amounts (need to count those in an each loop).
# if I cut off the first 3 lines of the txt file, I'm left with the verses
# need to take the '\n' off of each line

datadirs = File.join("**", "data", "**", "*.txt")

file = Dir.glob(datadirs)[0]

poem = IO.readlines(file)

number_of_lines_in_file = IO.readlines(file).count

#this will count the number of empty lines in the file
#number of empty lines = number of verses
empty_line_counter = 0
poem.each do |line|
  if line == "\n"
    empty_line_counter += 1
  end
end

poem_line_count = number_of_lines_in_file - 2 - empty_line_counter


poem_data_hash = { poem[1].gsub("\n","") => {poem[0].gsub("\n","") => {verses: empty_line_counter, lines: poem_line_count}}}

puts poem_data_hash
