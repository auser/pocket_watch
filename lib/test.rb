require "pocket_watch"
# require ::File.expand_path("~/.poolparty/clouds.rb")

# # PocketWatch.put(:cloud, clouds[:pp2])
# # PocketWatch.put(:name, "Test.rb")
# cloud = PocketWatch.get(:cloud)
# 
# p cloud.files.map {|a| a.name }
# p cloud.packages.map {|a| a.name }
h = RemoteHash.new
# h[:roger] = "moore"
# h[:moore] = -1
# cld = clouds[:pp2]
# h[:cloud] = cld.dsl_options
# h[:roger] = "moore"
# h[:moore] = -1
# p h[:roger] # => 1
p h.fetch(:cloud)
