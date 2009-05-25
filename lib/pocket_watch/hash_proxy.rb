require 'thread'
 
class HashProxy
  include PocketWatch::Marshal

  def initialize(h)
    @hsh = h
  end
 
  def method_missing(meth, *args, &block)
    o = send_to_proxy meth, *args, &block
    store
    o
  end
  
  def send_to_proxy(meth,*a,&block)
    mutex.synchronize do
      proxy_obj.__send__(meth, *a, &block)
    end
  end
  
  def mutex
    @mutex ||= Mutex.new
  end
    
  def reset!
    ::FileUtils.rm "/tmp/cache/.pocketwatch"
  end
  
  def proxy_obj
    @proxy_obj ||= (load_from_marshalled_data || hsh)
  end
  def hsh;@hsh ||= {};end
  
  def store
    marshal("/tmp/cache/.pocketwatch", proxy_obj)
  end
  def load_from_marshalled_data
    marshal("/tmp/cache/.pocketwatch") || nil
  end
  
end