#!/usr/bin/env rake


require "bundler"
Bundler::GemHelper.install_tasks

require "shoulda/tasks"

require "rake/testtask"
Rake::TestTask.new(:test) do |test|
  test.ruby_opts = ["-rubygems"] if defined? Gem
  test.libs << "lib" << "test"
  test.pattern = "test/**/*_test.rb"
end

task :default => :test
