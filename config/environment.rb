# Fill in parameters for development/local database and e-mail account here. Changes for prod should be made
# in the Rakefile, as this file is overwritten on deploy.

PORT = 9000
DB_HOST = "localhost"
DB_USER = ENV['POSTGRES_USERNAME']
DB_PASSWORD = ENV['POSTGRES_PASSWORD']
DB_DATABASE = "cheesy_parts"
URL = "LOCALHOST:9000"
GMAIL_USER = ENV['GMAIL_USERNAME']
GMAIL_PASSWORD = ENV['GMAIL_PASSWORD']
LOGOUT_URL = "LOCALHOST:9000"
