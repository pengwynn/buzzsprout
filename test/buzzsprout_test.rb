require 'helper'

class BuzzsproutTest < Test::Unit::TestCase
  context "When hitting the Buzzsprout API" do

    should "return a list of episodes for a podcast" do
      stub_get("/105.json", "episode_list.json")
      list = Buzzsprout.episodes(105)
      list.first.title.should == 'Episode 0.1.0 - Chris Wanstrath from GitHub'
      list.last.id.should == 1805
    end

    should "return a list of tagged episodes for a podcast" do
      stub_get("/105.json?tags=javascript%2Cgithub", "tagged.json")
      list = Buzzsprout.episodes(105, %w(javascript github))
      list.first.title.should == 'Episode 0.0.7 - Mike Dirolf from 10gen and MongoDB'
      list.last.id.should == 1959
    end

    should "parse an episode url and fetch episode info" do
      stub_get("/105/12191.json", "episode.json")
      url = "http://changelogshow.com/105/12191-episode-0-3-0-sencha-touch-with-david-kaneda"
      ep = Buzzsprout.episode_from_url(url)
      ep.tags.size.should == 6
      ep.tags.first.should == 'git'
    end

    context "when fetching info for a single episode" do

      setup do
        stub_get("/105/2274.json", "episode.json")
        @episode = Buzzsprout.episode(105, 2274)
      end

      should "return info about an episode for a podcast" do

        @episode.title.should == 'Episode 0.1.0 - Chris Wanstrath from GitHub'
        @episode.id.should == 2274
      end

      should "display episode duration in a friendly format" do
        @episode.duration.should == "77:55"
      end

      should "display episode date in a Ruby Date" do
        @episode.date.year.should == 2010
        @episode.date.month.should == 1
      end

      should "display a tags array" do
        @episode.tags.size.should == 6
        @episode.tags.first.should == 'git'
      end

      should "indicate if a lesson is on s3 (and processed)" do
        @episode.s3?.should == true
      end

      should "indicate if a lesson is live" do
        @episode.live?.should == true
      end
    end

  end

end
