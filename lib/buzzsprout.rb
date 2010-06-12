require 'rubygems'
require 'time'
gem 'activesupport', '~> 2.3.2'
require 'activesupport'

gem 'hashie', '>= 0.1.3'
require 'hashie'

gem 'httparty', '>= 0.5.0'
require 'httparty'



directory = File.expand_path(File.dirname(__FILE__))

Hash.send :include, Hashie::HashExtensions

module Buzzsprout
  
  # List all the episodes for a podcast
  #
  # @param [Fixnum] podcast_id The ID for the podcast
  # @param [Array<String>] tags An array of tags to filter episodes
  # @return [Array<Episode>] A list of episodes matching the query
  def self.episodes(podcast_id, tags=[])
    Client.episodes(podcast_id, tags)
  end

  # Retrieve episode details
  #
  # @param [Fixnum] podcast_id The ID for the podcast
  # @param [Fixnum] episode_id The ID for the episode
  # @return [Episode] A list of episodes matching the query
  def self.episode(podcast_id, episode_id)
    Client.episode(podcast_id, episode_id)
  end
  
end

require File.join(directory, 'buzzsprout', 'episode')
require File.join(directory, 'buzzsprout', 'client')