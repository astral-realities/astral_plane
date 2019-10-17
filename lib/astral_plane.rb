require "astral_plane/version"
require 'astral_plane/http_client/abstract_http_client'
require 'astral_plane/http_client/heroku'
require 'astral_plane/http_client/digital_ocean'
require 'configurable'

module AstralPlane
  include Configurable.with(:digital_ocean_token, :heroku_token)

  class Error < StandardError; end
  # Your code goes here...
end
