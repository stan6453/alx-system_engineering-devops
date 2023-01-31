#!/usr/bin/env ruby

matchdata = ARGV[0].scan(/hb{0,1}tn/)
puts "#{matchdata.join()}"
