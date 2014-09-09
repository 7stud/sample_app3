# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp2::Application.config.secret_key_base = 'e9363e1285e725dfdf7d288360dcb2bc5a7ac91393ae576062ba842e3acfee7fc6cca2ffd66e278707437da321b267fd3cb653c6e90d7056bd17ac9fa318e9e6'
#
#
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SampleApp2::Application.config.secret_key_base = secure_token

