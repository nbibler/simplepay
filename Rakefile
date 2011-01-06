%w[rubygems rake rake/clean rake/testtask fileutils].each { |f| require f }
#require File.dirname(__FILE__) + '/lib/simplepay'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |p|
    p.name        = "simplepay"
    p.authors     = ['Nathaniel E. Bibler']
    p.email       = 'gem@nathanielbibler.com'
    p.summary = 'Amazon SimplePay helpers for Rails 3'
    p.files = Dir["*", "{lib}/**/*"]
    p.add_dependency 'activesupport', '~>3.0.0'
    p.add_dependency 'nokogiri', '~>1.4'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo geminstall jeweler"
end

Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/test_*.rb'
  t.ruby_opts << '-rubygems'
  t.libs << 'test'
  t.verbose = true
end

task :default => [:test]
#task :release_and_update => [:gemspec, :release, :website, :post_news]
