$:.unshift("#{File.dirname(__FILE__)}/../lib")
require "pocket_watch"
puts HashTable.get(:cloud)