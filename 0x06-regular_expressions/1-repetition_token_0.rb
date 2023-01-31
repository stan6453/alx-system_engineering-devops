#!/usr/bin/env ruby
matchdata = ARGV[0].scan(/hbt{2,5}n/)
puts "#{matchdata.join()}"
