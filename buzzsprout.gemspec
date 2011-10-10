# -*- encoding: utf-8 -*-
require File.expand_path('../lib/buzzsprout/version', __FILE__)

Gem::Specification.new do |s|
  s.add_development_dependency 'rake', '~> 0.9.0'
  s.add_development_dependency 'fakeweb', '~> 1.2.5'
  s.add_development_dependency 'jnunemaker-matchy', '0.4.0'
  s.add_development_dependency 'mocha', '>= 0.9.4'
  s.add_development_dependency 'shoulda', '~> 2.11.0'

  s.add_dependency 'hashie', '~> 1.0.0'
  s.add_dependency 'httparty', '~> 0.5.2'

  s.name = %q{buzzsprout}
  s.version = Buzzsprout::VERSION.dup
  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6")
  s.authors = ["Wynn Netherland"]
  s.date = %q{2011-10-09}
  s.description = %q{Ruby wrapper for the stealth mode Buzzsprout API}
  s.email = %q{wynn.netherland@gmail.com}
  s.files = `git ls-files`.split("\n")
  s.homepage = %q{http://github.com/pengwynn/buzzsprout}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Wrapper for the stealth mode Buzzsprout API}
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

end




