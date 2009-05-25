require "rubygems"
require "carrot"
require "pocket_watch/marshal"
require "pocket_watch/hash_proxy"
require "pocket_watch/server"
require "pocket_watch/remote_hash"

BasicSocket.do_not_reverse_lookup = true

module PocketWatch
  
  def self.storage
    @storage ||= {}
  end
  
  def self.get(key)
    Client.get(key)
  end
  
  def self.put(key, obj)
    Client.put(key, obj)
  end
  
  def self.port(pt=9000)
    @port ||= pt
  end
  
  def self.port=(pt)
    @port = pt
  end
  
end