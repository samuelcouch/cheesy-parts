# Copyright 2012 Team 254. All Rights Reserved.
# @author pat@patfairbank.com (Patrick Fairbank)
#
# Sets up database connection.

require "pathological"

require "config/environment"

LOCAL_DB = { :adapter=> 'postgres', :host => DB_HOST, :user => DB_USER, :password => DB_PASSWORD, :database => DB_DATABASE }

DB = Sequel.connect(ENV['DATABASE_URL'] || LOCAL_DB)
