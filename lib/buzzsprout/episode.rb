module Buzzsprout
  class Episode < Hashie::Dash
    property :s3
    # Gets/sets the episode artist
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

    # Has the episode been uploaded to S3?
    # @return [true,false] Boolean indicating whether or not the episode is on S3
    def s3?
      !!self[:s3]
    end

    # Has the episode been published?
    # @return [true,false] Boolean indicating whether or not the episode has been published
    def live?
      !!self[:live]
    end

    # Formatted duration
    # @return [String] duration formatted as time
    def duration
      segments = [self[:duration]/60]
      segments << (self[:duration] % 60 )
      segments.map {|t| t.to_s.rjust(2, '0')}.join(':')
    end

    # Set the duration
    # @param [String] duration as time
    def duration=(value)
      new_duration = value.to_s.split(":").reverse
      s, m = new_duration
      self[:duration] = (s.to_i + (m.to_i*60))
    end

    # Duration in seconds
    # @return [Integer] duration in seconds
    def duration_in_seconds
      self[:duration]
    end

    # List of tags
    # @return [Array<String>] array of tags for this episode
    def tags
      self[:tags].split(",")
    end

  end
end
