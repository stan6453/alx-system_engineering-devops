#!/usr/bin/env ruby

matchfrom = ARGV[0].scan(/\[from:\+{0,1}[\w0-9]+\]/)
matchto = ARGV[0].scan(/\[to:\+{0,1}\d{11}\]/)
matchflag = ARGV[0].scan(/\[flags:[0-9:-]+\]/)
puts "#{matchfrom[0][6..-2]},#{matchto[0][4..-2]},#{matchflag[0][7..-2]}"

