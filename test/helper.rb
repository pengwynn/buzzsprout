require 'test/unit'
require 'pathname'
require 'rubygems'

gem 'shoulda', '>= 2.10.1'
gem 'jnunemaker-matchy', '0.4.0'
gem 'fakeweb', '>= 1.2.5'

require 'shoulda'
require 'matchy'
require 'fakeweb'
require 'redgreen'


$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'buzzsprout'

FakeWeb.allow_net_connect = false

class Test::Unit::TestCase
end

def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end

def buzzsprout_url(url)
  url =~ /^http/ ? url : "http://www.buzzsprout.com#{url}"
end

def stub_get(url, filename, options={})
  opts = {:body => fixture_file(filename)}.merge(options)
  
  FakeWeb.register_uri(:get, buzzsprout_url(url), opts)
end

def stub_post(url, filename)
  FakeWeb.register_uri(:post, buzzsprout_url(url), :body => fixture_file(filename))
end

