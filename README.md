Cheesy Parts
============

Cheesy Parts is a web-based system for tracking parts through the design and manufacture cycle. It assigns
part numbers with which CAD files can be saved to version control and stores information about parts'
current manufacturing status.

For more information about the original project, see [Team254/cheesy-parts](https://github.com/Team254/cheesy-parts).

## Development

Prerequisites: 

* Ruby 1.9 (1.9.3-p286 is what we use in development and production)
* [Bundler](http://gembundler.com)
* PostgreSQL

To run Cheesy Parts locally:

1. Create an empty Postgres database ("cheesy-parts" is the default) and a user account with full permissions on it.
1. Run `bundle install`. This will download and install the gems that Cheesy Parts depends on.
1. Run `bundle exec rake db:migrate`. This will run the database migrations to create the necessary tables.
1. Run `ruby parts_server_control.rb run`