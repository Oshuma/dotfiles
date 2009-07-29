# Load some libraries
require 'rubygems'
require 'hirb'
require 'wirble'

begin
  require File.expand_path(ENV['HOME'] + '/Projects/look_at/look_at')
rescue LoadError => error
  $stderr.puts error
end

Hirb.enable :pager => false

# Use Wirble (with color)
Wirble.init
Wirble.colorize

# Rails shit.
railsrc = File.join(ENV['HOME'], '.railsrc')
load railsrc if $0 == 'irb' && ENV['RAILS_ENV']
