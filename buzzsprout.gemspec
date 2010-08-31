require 'bundler'
require 'bundler/version'
require 'lib/buzzsprout'

Gem::Specification.new do |s|
  s.name = %q{buzzsprout}
  s.version = Buzzsprout::VERSION
  s.platform    = Gem::Platform::RUBY
  s.required_rubygems_version = ">= 1.3.6"
  s.authors = ["Wynn Netherland"]
  s.date = %q{2010-08-30}
  s.description = %q{Ruby wrapper for the stealth mode Buzzsprout API}
  s.email = %q{wynn.netherland@gmail.com}
  s.files = Dir.glob("{lib}/**/*")
  s.homepage = %q{http://wynnnetherland.com/projects/buzzsprout/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Wrapper for the stealth mode Buzzsprout API}
  s.test_files = Dir.glob("{test}/**/*")

  s.add_bundler_dependencies
end




