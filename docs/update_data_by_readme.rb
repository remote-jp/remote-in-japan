#!/usr/bin/env ruby

require 'kramdown'
require 'pry'

readme_en = IO.readlines('../README.en.md')[8..-20]
readme_ja = IO.readlines('../README.md')[10..-17]

readme_en.each_with_index do |line, index|
  next unless line.include? '|'
  company = {}
  l = line.split '|'
  name_and_link = Kramdown::Document.new(l[1]).root.children[0].children[0]

  company[:name] = name_and_link.children[0].value.strip
  company[:link] = name_and_link.attr['href']
  company[:id]   = company[:name].gsub(' ', '_').delete(".,").downcase
  company[:desc] = Kramdown::Document.new(l[2].strip).to_html
  company[:full] = l[3].include?('ok') ? true : false

  puts company[:desc]
end
