class HashTable
  def self.default_hash(h)
    @default_hash ||= h
  end
  def self.put(k,o)
    hash_proxy[k] = o
    hash_proxy.store
  end
  def self.get(k)
    publish(hash_proxy)
    msg = queue.pop(:ack => true)
    ::Marshal.load(msg).fetch(k)
  end
  def self.with_messages(&block)
    return if queue.message_count == 0
    publish(hash_proxy)
    while msg = queue.pop(:ack => true)
      data = ::Marshal.load(msg)
      block.call(data)
      queue.ack
    end    
  end
  private
  def self.hash_proxy
    @hash_proxy ||= HashProxy.new(@hsh)
  end
  def self.publish(hsh)
    queue.publish(::Marshal.dump(hsh))
  end
  def self.queue
    Carrot.queue('hashtable')
  end
end