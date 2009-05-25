class RemoteHash 
  
  def method_missing(m, *args, &block)
    hash_proxy.__send__(m, *args, &block)
  end
  
  def hash_proxy
    @hash_proxy ||= DRbObject.new(nil,"druby://127.0.0.1:#{PocketWatch.port}")
  end
end