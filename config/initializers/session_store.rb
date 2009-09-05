# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_thumbometer_session',
  :secret      => 'ad622fa1ccc18dd98471eb4e48ca6d42ec7579bdab3392e7d3099af4dc9ab8cd518f961c812f1a53da95f93a7694fdc2dcb851d4b4128b234821c8291c3ba18d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
