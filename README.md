# Planning PermiSMSion

A project from the [Hack-ney-thon](http://minibarlabs.com/join-us-for-hackney-councils-first-hackney-hack-day/) by [Phil Nash](https://twitter.com/philnash). This allows users to sign up and choose to receive updates on planning permission applications in their area by SMS or email.

Excuse the name, it's unpronounceable and not even a good pun.

![The Planning PermiSMSion home page](https://raw.github.com/philnash/planning-permismsion/master/screenshots/homepage.png)

## Running the application

First, you will need a [Twilio](https://www.twilio.com/) and a [SendGrid](https://sendgrid.com/) account and your account details to hand. You will also need Ruby, Bundler and PostgreSQL installed.

Clone this repository.

    $ git clone git@github.com:philnash/planning-permismsion.git
    $ cd planning-permismsion

Install the gems

    $ bundle install

Copy the example config file

    $ cp config/env.yml.example config/env.yml

Open `config/env.yml` and enter your Twilio and SendGrid credentials and a large random string for `SECRET_KEY_BASE`.

Create and migrate the database

    $ rake db:create:all migrate

Run the tests

    $ rake test

There may only be 3 tests (it was a 24 hour hackathon!), but it should show that it's working.

Start the server

    $ rails server

You should now have an instance of planning-permismsion running on [http://localhost:3000](http://localhost:3000).

Sign up, create a subscription and then you can import one of the example CSVs to test that subscriptions are working with the following rake task:

    $ rake import URL=http://localhost:3000/example1.csv

## Powered by

* [Ruby](https://www.ruby-lang.org/en/)
* [Ruby on Rails](http://rubyonrails.org/)
* [PostgreSQL](http://www.postgresql.org/)
* [Geocoder](http://www.rubygeocoder.com/)
* [ActiveAdmin](http://activeadmin.info/)
* [Devise](https://github.com/plataformatec/devise)
* [Bootstrap](http://getbootstrap.com/)
* [Twilio](https://www.twilio.com)
* [SendGrid](https://sendgrid.com/)
* hacking furiously over a weekend.
