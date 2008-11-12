# Load some libraries
require 'rubygems'
require 'wirble'

# Use Wirble (with color)
Wirble.init
Wirble.colorize

railsrc = File.join(ENV['HOME'], '.railsrc')
load railsrc if $0 == 'irb' && ENV['RAILS_ENV']
