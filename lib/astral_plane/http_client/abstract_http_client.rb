require 'net/https'
require 'uri'
require 'pry'

class AstralPlane::AbstractHttpClient

  BASE_URL = ''.freeze

  METHODS = {
    :post => "Post",
    :get => "Get",
    :delete => "Delete"
  }.freeze

  class << self
    METHODS.each do |key, value|
      define_method(key) do |endpoint, token, headers = {}, body = {}|
        uri = URI.parse(BASE_URL + endpoint)
        binding.pry
        http = Net::HTTP.new(uri.host, uri.port)
        request = Object.const_get("Net::HTTP::#{value}").new(uri.request_uri)
        self.combined_headers(token).merge(headers).each_pair do |header, value|
          request[header] = value
        end
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

  def self.token
    raise NotImplementedError
  end

  def self.get_response(http, request)
    http.request(request)
  end

  def self.headers(token = '')
    {
      'Authorization' => "Bearer: #{token}",
    }
  end

  def self.custom_headers()
    {}
  end

  def self.combined_headers(token)
    self
      .headers(token)
      .merge(self.custom_headers)
  end
end
