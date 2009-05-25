require "pocket_watch"
require ::File.expand_path("~/.poolparty/clouds.rb")

HashTable.put(:cloud_min, clouds[:pp2].minimum_instances)
10.times do |i|
  puts "i = #{i}"
  HashTable.put(i.to_sym, i)
end
HashTable.put(:cloud, clouds[:pp2].name)
puts HashTable.get(:cloud)
puts HashTable.get(:cloud_min)