#!/usr/bin/env ruby

require 'pry' unless ENV['JEKYLL_ENV'] == 'production'
require 'kramdown'
require 'sanitize'

readme_en = IO.readlines('../README.en.md')[8..-20]
readme_ja = IO.readlines('../README.md')[10..-17]

readme_en.each_with_index do |line, index|
  next unless line.include? '|'

  l = line.split '|'
  name_and_link = Kramdown::Document.new(l[1]).root.children[0].children[0]
  name = name_and_link.children[0].value.strip
  link = name_and_link.attr['href']
  id   = name.gsub(' ', '_').gsub('&', 'and').delete(".,").downcase

  desc = Sanitize.clean(Kramdown::Document.new(l[2].strip).to_html.strip)

  company =  "---\n"
  company << "layout: post\n"
  company << "lang: en\n"
  company << "permalink: /en/#{id}\n"
  company << "title: #{name}\n"
  company << "description: #{desc}\n"
  company << "is_full_remote: #{l[3].include?('ok') ? true : false}\n"
  company << "---\n"

  #company << "date: 2019-01-01 00:00:00 +0900\n" # Not being used
  #company << "by: John Doe\n" # Not being used
  #company << "image: ''\n" # Not being used

  IO.write("./en/_posts/2020-02-22-#{id}", company)
end