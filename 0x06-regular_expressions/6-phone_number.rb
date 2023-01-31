#!/usr/bin/env ruby

matchdata = ARGV[0].scan(/^\d{10,10}/)
puts "#{matchdata.join()}"
