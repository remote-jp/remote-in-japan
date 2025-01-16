#!/usr/bin/env ruby

require 'kramdown'
require 'sanitize'

lang   = ARGV[0] || 'en'
readme = if lang == 'en'
           IO.readlines('../README.en.md')
         elsif lang == 'ja'
           IO.readlines('../README.md')
         else
           puts "Need to pass [en|ja] to exec this task:"
           puts "Ex. $ bundle exec rake upsert_data_by_readme:en"
           puts "Ex. $ bundle exec rake upsert_data_by_readme:ja"
           puts "Ex. $ bundle exec rake upsert_data_by_readme"
           puts "    # This generate both data in English and Japanese"
           exit
         end

# Remove existing files, parse README, and re-generate them
Dir.glob("./#{lang}/_posts/*.md").each { |filename| File.delete(filename) }

start_parsing_flag = false
readme.each_with_index do |line, index|

  # Operate start-of and end-of parsing table of lines in README.
  if start_parsing_flag == false
    start_parsing_flag = true if line.start_with? '| ---'
    next
  end
  break if line.start_with? '##' # Stop parsing if reached to next heading.

  # Generate Markdown files to publish from remotework.jp
  next unless line.include? '|'
  cells = line.gsub('\|', '&#124;').split '|'

  # Fetch company name and its link from 1st cell
  name_and_link = Kramdown::Document.new(cells[1]).root.children[0].children[0]
  name  = name_and_link.children[0].value.strip
  link  = name_and_link.attr['href']
  id    = name.gsub(' ', '_')
    .gsub('＆', 'and')
    .gsub('&',  'and')
    .gsub('（', '(')
    .gsub('）', ')')
    .delete(".,").downcase

  # Fetch company description from 2nd cell and categories from the other cell(s)
  description    = Kramdown::Document.new(cells[2].strip).to_html.strip
  is_full_remote = cells[3].include?('ok') ? 'full_remote' : ''

  # Generate Jekyll post with fetched company data above
  company = <<~COMPANY_PAGE
    ---
    layout: post
    lang: #{lang}
    permalink: /#{lang}/#{id}
    title: #{name}
    description: '#{Sanitize.clean(CGI.unescapeHTML description).strip}'
    categories: #{is_full_remote}
    link: #{link}
    ---

    #{CGI.unescapeHTML description}
  COMPANY_PAGE

  #company << "date: 2019-01-01 00:00:00 +0900\n" # Not being used
  #company << "by: John Doe\n"                    # Not being used
  #company << "image: ''\n"                       # Not being used

  IO.write("./#{lang}/_posts/2020-02-22-#{id}.md", company)
  puts "Upsert: ./#{lang}/_posts/2020-02-22-#{id}.md"
end
puts ''
