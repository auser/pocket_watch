# Change this file to be a wrapper around your daemon code.

# Do your post daemonization configuration here
# At minimum you need just the first line (without the block), or a lot
# of strange things might start happening...
DaemonKit::Application.running! do |config|
  # Trap signals with blocks or procs
  config.trap( 'INT' ) do
    # do something clever
    DaemonKit.logger.info 'Going down'
    PocketWatch::Server.shutdown
    exit
  end
  
end

def start_it(nth=0, retry_times=3)
  # Sample loop to show process
  exit(0) if @terminated
  raise StandardError.new("Could not start PocketWatch. Check log for details") if nth >= retry_times
  begin
    DaemonKit.logger.info "Starting pocket watch on #{PocketWatch.port}"
    PocketWatch::Server.run(PocketWatch.storage)
  rescue Exception => e
    # Try again    
    DaemonKit.logger.info "Error starting PocketWatch: #{e}\n\n\t\tTrying again"
    start_it(nth + 1)
  end
end

# start_it
PocketWatch::Server.run(PocketWatch.storage, ARGV.shift)