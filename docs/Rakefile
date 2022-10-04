task default: 'test'

desc 'Upsert company data from English/Japanese README'
task :upsert_data_by_readme do
  ruby "upsert_data_by_readme.rb en"
  ruby "upsert_data_by_readme.rb ja"
end

namespace :upsert_data_by_readme do
  desc 'Upsert company data from English README'
  task :en do
    ruby "upsert_data_by_readme.rb en"
  end

  desc 'Upsert company data from Japanese README'
  task :ja do
    ruby "upsert_data_by_readme.rb ja"
  end
end

require 'html-proofer'
# cf. GitHub - gjtorikian/html-proofer
# https://github.com/gjtorikian/html-proofer

task test: [:build] do
  options = {
    allow_hash_href:  true,
    disable_external: true,
    checks: ['Links', 'Images', 'OpenGraph', 'Favicon'],

    # NOTE: You can ignore file, URL, and response as follows
    ignore_files: [
      '_site/google3a4de0d83c05ed13.html',
    ],
    ignore_urls: [
      %r{^http://www.ahunrupar.co},
      %r{^http://kanamei.co.jp},
      %r{^http://www.unicon-ltd.com},
      %r{^/ja/グロース},
    ],
    #ignore_status_ignore: [0, 500, 999],
  }

  HTMLProofer.check_directory('_site/', options).run
end

# Enable 'build' to flush cache files via 'clean'
task build: [:clean] do
  system 'bundle exec jekyll build'
end

task :clean do
  system 'bundle exec jekyll clean'
end
