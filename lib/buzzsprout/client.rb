module Buzzsprout
  
  class Client
    include HTTParty
    format :json
    base_uri "http://www.buzzsprout.com"

    def self.episodes(podcast_id, tags=[])
      query = {}
      tags = tags.join(",") if tags.is_a?(Array)
      query[:tags] = tags if tags and not tags.empty?
      response = self.get("/#{podcast_id}.json", :query => query)
      response.map{|item| Buzzsprout::Episode.new(item['episode'])}
    end

    def self.episode(podcast_id, episode_id)
      Buzzsprout::Episode.new(self.get("/#{podcast_id}/#{episode_id}.json")['episode'])
    end
  end
  
end