module PocketWatch
  class Server    
        
    def self.run(h={}, file=nil)
      eval(open(file).read, file) if file
      new(h).run
    end
    
    def self.shutdown
      new.shutdown
    end
    
    def initialize(h={})
      @hsh = h
    end
    
    def hash_proxy
      @hash_proxy ||= HashProxy.new(@hsh)
    end
        
    def run
      DRb.start_service("druby://127.0.0.1:#{PocketWatch.port}", hash_proxy)
      DRb.thread.join # Don't exit just yet!
    end
    
    def shutdown
      hash_proxy.store
      DRb.stop_service
    end

  end
end
