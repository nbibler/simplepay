%w[rubygems rake rake/clean fileutils].each { |f| require f }
#require File.dirname(__FILE__) + '/lib/simplepay'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |p|
    p.name        = "simplepay"
    p.authors     = ['Nathaniel E. Bibler']
    p.email       = 'gem@nathanielbibler.com'
    p.summary = 'Amazon SimplePay helpers for Rails 3'
    p.files = Dir["*", "{lib}/**/*"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo geminstall jeweler"
end

task :default => [:test]
#task :release_and_update => [:gemspec, :release, :website, :post_news]
