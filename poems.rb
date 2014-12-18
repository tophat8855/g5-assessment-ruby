# go through each file
# parse them by lines (look up how to parse .txt file)
# make a hash
# second line is key to hash
# first line (aka title) is value of the second and is key to hash that
# points to hash of verse and line amounts.
# need to take the '\n' off of each line

datadirs = File.join("**", "data", "**", "*.txt")

file = Dir.glob(datadirs)[0]

poem = IO.readlines(file)

poem_data_hash = { poem[1] => {poem[0] => "thing"}}

puts poem_data_hash
