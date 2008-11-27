# Load some libraries
require 'rubygems'
require 'wirble'

begin
  require File.expand_path(ENV['HOME'] + '/Projects/look_at/look_at')
rescue LoadError => error
  $stderr.puts error
end


# Use Wirble (with color)
Wirble.init
Wirble.colorize

railsrc = File.join(ENV['HOME'], '.railsrc')
load railsrc if $0 == 'irb' && ENV['RAILS_ENV']
