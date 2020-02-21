#!/usr/bin/env ruby

require 'kramdown'
require 'pry'

text = IO.readlines('../README.en.md')[8..-20]
text.each do |line|
  next unless line.include? '|'
  company = {}
  l = line.split '|'
  name_and_link = Kramdown::Document.new(l[1]).root.children[0].children[0]

  company[:name] = name_and_link.children[0].value.strip
  company[:link] = name_and_link.attr['href']
  company[:id]   = company[:name].gsub(' ', '_').delete(".,").downcase
  company[:desc] = l[2].strip
  company[:full] = l[3].include?('ok') ? true : false

  puts company[:id]
end


