# Change this file to be a wrapper around your daemon code.

# Do your post daemonization configuration here
# At minimum you need just the first line (without the block), or a lot
# of strange things might start happening...
DaemonKit::Application.running! do |config|
  # Trap signals with blocks or procs
  config.trap( 'INT' ) do
    # do something clever
    DaemonKit.logger.info 'Going down'
    Carrot.stop
    exit
  end
  
end

# This loop just ensures the daemon keeps running
loop do
  sleep(60)
end