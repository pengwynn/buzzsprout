# require 'time'

require 'hashie'
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

  # Retrieve episode details
  #
  # @param [Fixnum] url URL of the episode
  # @return [Episode] A list of episodes matching the query
  def self.episode_from_url(url)
    Client.episode_from_url(url)
  end

end

require File.join(directory, 'buzzsprout', 'version')
require File.join(directory, 'buzzsprout', 'episode')
require File.join(directory, 'buzzsprout', 'client')
