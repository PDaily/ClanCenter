# ClanCenter

[![Build Status](https://travis-ci.org/PDaily/ClanCenter.svg)](https://travis-ci.org/PDaily/ClanCenter)
[![Code Climate](https://codeclimate.com/github/PDaily/ClanCenter/badges/gpa.svg)](https://codeclimate.com/github/PDaily/ClanCenter)
[![Coverage Status](https://coveralls.io/repos/PDaily/ClanCenter/badge.svg)](https://coveralls.io/r/PDaily/ClanCenter)
[![Inch-CI](https://inch-ci.org/github/pdaily/clancenter.svg?branch=master)](https://inch-ci.org/github/pdaily/clancenter)

**ClanCenter** is a [Rails 4] app written in [Ruby]. It draws heavy inspiration from [the100.io] in that you can create gaming sessions. Aside from that you can create a database of games and different game modes on the fly. 

### Requirements

* Ruby 2.15

* Rails 4.2.0

* Postgres

* Redis

### Documentation

Please see the wiki (coming soon!)
___
### Configuration

###Database
 * Set up your database in `config/database.yml` 
    * Defaults to: 
    > **user:** postgres 
    > 
    > **password:** postgres

 * Run `rake db:migrate && rake db:seed`

###Assets
* Run `RAILS_ENV=development rake assets:precompile`
* Run `rm -rf public/assets` 

    #### Assets Issue
    > Right now, you have to precompile and remove the compiled assets as they convert from less. I'm looking into a smoother option at getting this corrected.

### Redis & Sidekiq
We use Redis and Sidekiq to manage background jobs (mailers, removing stale game sessions).

#####Redis
* Make sure you have Redis ready to rock and running, if you have no clue about it check [here]

#####Sidekiq
* Run `bundle exec sidekiq`

___
##Wrap up
All in all you should be good to go at this point. View `http://localhost:3000` to see what it looks like!
____
### Testing
We use Rspec for testing and Factory_Girl for creating our test structures.
* Simply run `rake spec`

[the100.io]:https://www.the100.io/
[Rails 4]:http://rubyonrails.org/
[Ruby]:https://www.ruby-lang.org/
[here]:http://redis.io/