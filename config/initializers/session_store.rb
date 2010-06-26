# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Trial_session',
  :secret      => 'd3a73952d5cb8cd3bd928ffb820c6231b941c600164cd320f72de9265d6a08cc06a17a58514835307ea9e906a3f803dddb3085576113070dd828a3eb5c58e12e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
