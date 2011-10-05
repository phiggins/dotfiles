#load libraries
require 'rubygems'
require 'wirble'

# start wirble with color
Wirble.init
Wirble.colorize

# override colors to remove dark blue
colors = Wirble::Colorize.colors.merge({
	:refers => :green,
	:object_addr_prefix => :green,
	:object_line_prefix => :green,
	:comma => :green
})

Wirble::Colorize.colors = colors
