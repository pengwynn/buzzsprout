
module Buzzsprout
  class Episode < Hashie::Dash
    property :s3
    property :artist
    property :size
    property :title
    property :tags
    property :date
    property :podcast_id
    property :live
    property :id
    property :description
    property :duration
    property :updated_at
    property :created_at
    
    def s3?
      !!self[:s3]
    end
    
    def live?
      !!self[:live]
    end
    
    def duration
      segments = [self[:duration]/60]
      segments << (self[:duration] % 60 ) 
      segments.map {|t| t.to_s.rjust(2, '0')}.join(':')
    end
    
    def duration=(value)
      new_duration = value.to_s.split(":").reverse
      s, m = new_duration
      self[:duration] = (s.to_i + (m.to_i*60))
    end
    
    def duration_in_seconds
      self[:duration]
    end
    
    def tags
      self[:tags].split(",")
    end
    
  end
end