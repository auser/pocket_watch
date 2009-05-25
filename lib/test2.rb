require "pocket_watch"
# puts %x{ruby test.rb}

cloud = PocketWatch.get(:cloud)
p PocketWatch.get(:name)
p cloud.name
# p cloud
# 
# p cloud.packages.map {|a| a.name }