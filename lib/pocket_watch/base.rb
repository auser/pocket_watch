=begin rdoc
  A basic base class to provide the following API:
  
    class Rabbits < PocketWatch::Base
      store :cage, ["rabbit", "carrot"]
    end
  
  The cage can be retrieved with the following:
    PocketWatch.get(:cage)
=end
module PocketWatch
  class Base
        
    def self.store key, obj
      PocketWatch.storage[key] = obj
    end
    
    def self.use_port pt
      PocketWatch.port = pt
    end
    
  end
end