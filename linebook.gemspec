$:.unshift File.expand_path('../lib', __FILE__)
require 'linebook/version'
$:.shift

Gem::Specification.new do |s|
  s.name     = 'linebook'
  s.version  = Linebook::VERSION
  s.platform = Gem::Platform::RUBY
  s.author   = 'Simon Chiang'
  s.email    = 'simon.a.chiang@gmail.com'
  s.homepage = 'http://rubygems.org/gems/linebook'
  s.summary  = 'The standard library for Linecook'
  s.description = %w{
  The standard library for Linecook, providing helpers for POSIX and Linux.
  }.join(' ')
  
  s.rubyforge_project = ''
  s.require_path = 'lib'
  s.has_rdoc = true
  s.rdoc_options.concat %W{--main README -S -N --title Linebook}
  
  # add dependencies
  s.add_dependency('linecook', '~> 1.2')
  
  # list extra rdoc files here.
  s.extra_rdoc_files = %W{
    History
    README
    License.txt
    HowTo/Switch\ Users
    HowTo/Setup/Debian
    HowTo/Setup/openSUSE
    HowTo/Setup/Ubuntu
  }
  
  # list the files you want to include here.
  s.files = %W{
    attributes/linebook/shell.rb
    cookbook
    lib/linebook.rb
    lib/linebook/os/linux.rb
    lib/linebook/os/linux/utilities.rb
    lib/linebook/os/posix.rb
    lib/linebook/os/posix/utilities.rb
    lib/linebook/os/posix/variable.rb
    lib/linebook/os/ubuntu.rb
    lib/linebook/shell.rb
    lib/linebook/shell/bash.rb
    lib/linebook/version.rb
  }
end