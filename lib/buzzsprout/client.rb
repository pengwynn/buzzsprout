module Buzzsprout

  class Client
    include HTTParty
    format :json
    base_uri "http://www.buzzsprout.com"

    # List all the episodes for a podcast
    #
    # @param [Fixnum] podcast_id The ID for the podcast
    # @param [Array<String>] tags An array of tags to filter episodes
    # @return [Array<Episode>] A list of episodes matching the query
    def self.episodes(podcast_id, tags=[])
      query = {}
      tags = tags.join(",") if tags.is_a?(Array)
      query[:tags] = tags if tags and not tags.empty?
      response = self.get("/#{podcast_id}.json", :query => query)
      response.map{|item| Buzzsprout::Episode.new(item['episode'])}
    end

    # Retrieve episode details
    #
    # @param [Fixnum] podcast_id The ID for the podcast
    # @param [Fixnum] episode_id The ID for the episode
    # @return [Episode] A list of episodes matching the query
    def self.episode(podcast_id, episode_id)
      Buzzsprout::Episode.new(self.get("/#{podcast_id}/#{episode_id}.json")['episode'])
    end

    # Retrieve episode details
    #
    # @param [Fixnum] url URL of the episode
    # @return [Episode] A list of episodes matching the query
    def self.episode_from_url(url)
      podcast_id, episode_id = url.split("/").map{|seg| seg.to_i}.reject{|i| i < 1 }
      self.episode(podcast_id, episode_id)
    end
  end

end
