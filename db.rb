# Copyright 2012 Team 254. All Rights Reserved.
# @author pat@patfairbank.com (Patrick Fairbank)
#
# Sets up database connection.

require "pathological"

require "config/environment"

DB = Sequel.postgres(ENV['DATABASE_URL'] || { :host => DB_HOST, :user => DB_USER, :password => DB_PASSWORD, :database => DB_DATABASE })
