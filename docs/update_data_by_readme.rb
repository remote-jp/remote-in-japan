#!/usr/bin/env ruby

require 'kramdown'

text = IO.readlines('../README.en.md')[8..-20]
text.each do |line|
  next unless line.include? '|'
  company = {}
  l = line.split '|'
  company[:name] = l[1]
  company[:desc] = l[2].strip
  company[:full] = l[3].include?('ok') ? true : false

  puts company
end


