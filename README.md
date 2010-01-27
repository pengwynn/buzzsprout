# buzzsprout

Ruby wrapper for the (yet unreleased, undocumented) [Buzzsprout](http://buzzsprout.com) API.

## Installation

    sudo gem install buzzsprout
    
## Usage

### Getting a list of episodes

    # get your podcast ID from your RSS feed http://www.buzzsprout.com/105.rss
    >> Buzzsprout.episodes(105)
    => [<#Buzzsprout::Episode artist="Adam Stacoviak and Wynn Netherland" created_at=Mon Jan 25 11:53:02 -0600 2010 date=Mon, 25 Jan 2010 description="Adam and Wynn talk with Chris Wanstrath aka @defunkt from GitHub about the magic of Git, the past, present and future of GitHub, building a bootstrapped startup and some other cool stuff you'll just have to hear for yourself." duration=4675 id=2274 live=true podcast_id=105 s3=true size=37400482 tags="git, github, interview, bootstrapping, business, startups" title="Episode 0.1.0 - Chris Wanstrath from GitHub" updated_at=Mon Jan 25 13:36:42 -0600 2010>]
    

### Get a list of tagged episodes
    >> tags = %w(git github)
    >> Buzzsprout.episodes(105, tags)
    => [<#Buzzsprout::Episode artist="Adam Stacoviak and Wynn Netherland" created_at=Mon Jan 25 11:53:02 -0600 2010 date=Mon, 25 Jan 2010 description="Adam and Wynn talk with Chris Wanstrath aka @defunkt from GitHub about the magic of Git, the past, present and future of GitHub, building a bootstrapped startup and some other cool stuff you'll just have to hear for yourself." duration=4675 id=2274 live=true podcast_id=105 s3=true size=37400482 tags="git, github, interview, bootstrapping, business, startups" title="Episode 0.1.0 - Chris Wanstrath from GitHub" updated_at=Mon Jan 25 13:36:42 -0600 2010>]
    
### Get a single episode
    # podcast_id, episode_id
    >> Buzzsprout.episodes(105, 2274)
    => <#Buzzsprout::Episode artist="Adam Stacoviak and Wynn Netherland" created_at=Mon Jan 25 11:53:02 -0600 2010 date=Mon, 25 Jan 2010 description="Adam and Wynn talk with Chris Wanstrath aka @defunkt from GitHub about the magic of Git, the past, present and future of GitHub, building a bootstrapped startup and some other cool stuff you'll just have to hear for yourself." duration=4675 id=2274 live=true podcast_id=105 s3=true size=37400482 tags="git, github, interview, bootstrapping, business, startups" title="Episode 0.1.0 - Chris Wanstrath from GitHub" updated_at=Mon Jan 25 13:36:42 -0600 2010>

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 [Wynn Netherland](http://wynnnetherland.com). See LICENSE for details.
