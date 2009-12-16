# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_affiliation_session',
  :secret      => 'da454f9d5c2bb6bb485de6f308bcf0da2dc64276a1fb50d23a658f1316ea8c1cfe4e167477887f717fc49877d94df1083e217262832abe6dbe3761c41ce7e8d3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
