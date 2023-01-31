#!/usr/bin/env ruby

matchdata = ARGV[0].scan(/^+{0,1}\d{10,10}/)
puts "#{matchdata.join()}"
