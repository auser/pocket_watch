# Be sure to restart your daemon when you modify this file

# Uncomment below to force your daemon into production mode
#ENV['DAEMON_ENV'] ||= 'production'

# Boot up
require File.join(File.dirname(__FILE__), 'boot')

DaemonKit::Initializer.run do |config|

  # The name of the daemon as reported by process monitoring tools
  config.daemon_name = 'pocket_watch'

  # Uncomment to allow multiple instances to run
  # config.mulitple = true

  # Force the daemon to be killed after X seconds from asking it to
  # config.force_kill_wait = 30

  # Configure the safety net (see DaemonKit::Safety)
  # config.safety_net.handler = :mail # (or :hoptoad )
  # config.safety_net.mail.host = 'localhost'
end
