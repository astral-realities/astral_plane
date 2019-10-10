require 'net/https'
require 'uri'

class AstralPlane::AbstractHttpClient

  METHODS = {
    :post => "Post",
    :get => "Get",
    :delete => "Delete"
  }.freeze

  class << self
    METHODS.each do |key, value|
      define_method(key) do |base_url, endpoint, token, body|
        uri = URI.parse(base_url + endpoint)
        http = Net::HTTP.new(uri.host, uri.port)
        request = Object.const_get("Net::HTTP::#{value}").new(uri.request_uri)
        request['Authorization'] = "Bearer: #{token}"
        request['Content-Type'] = "application/json"
        request.body = body if body

        get_response(http, request)
      end
    end
  end

  def self.restart_server
    raise NotImplementedError
  end

  def self.create_server
    raise NotImplementedError
  end

  def self.delete_server
    raise NotImplementedError
  end

  def self.list_servers
    raise NotImplementedError
  end

  def self.get_response(http, request)
    http.request(request)
  end
end
