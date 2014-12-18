# glob the files
# go through each file
# parse them by lines (look up how to parse .txt file)
# make a hash
# second line is key to hash
# first line (aka title) is value of the second and is key to hash that
# points to hash of verse and line amounts.

datadirs = File.join("**", "data", "**", "*.txt")

puts Dir.glob(datadirs)[0]
