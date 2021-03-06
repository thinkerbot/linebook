require 'rubygems'
require 'bundler'
Bundler.setup

require 'test/unit'
require 'linecook/test'
require 'benchmark'

if testcase = ENV['TESTCASE']
  ARGV << "--testcase=#{testcase}"
end

if name = ENV['NAME']
  ARGV << "--name=#{name}"
end
