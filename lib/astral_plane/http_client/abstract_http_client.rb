require 'net/https'
require 'uri'
require 'pry'

class AstralPlane::AbstractHttpClient

  METHODS = {
    :post => "Post",
    :get => "Get",
    :delete => "Delete"
  }.freeze

  # shared headers = all headers that are shared between vendors
  # custom headers = headers that are unique for that vendors
  # unique headers = set of unique headers on an individual request

  class << self
    METHODS.each do |key, value|
      define_method(key) do |endpoint, token, unique_headers = {}, body = {}|
        uri = URI.parse(base_url + endpoint)
        http = Net::HTTP.new(uri.host, uri.port)
        json_body = body.to_json
        http.use_ssl = true
        request = Object.const_get("Net::HTTP::#{value}").new(uri.request_uri)

        self.combined_headers(token).merge(unique_headers).each_pair do |header, value|
          puts header
          puts value
          request[header] = value
        end
        request['Content-Type'] = "application/json"
        request.body = json_body if body
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

  def self.base_url
    ''
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

  # keep in mind this specific header is for OAuth api, if other vendors
  # check for format
  def self.shared_headers(token = '')
    {
      'Authorization' => "Bearer #{token}",
    }
  end

  def self.custom_headers()
    {}
  end

  def self.combined_headers(token)
    self
      .shared_headers(token)
      .merge(self.custom_headers)
  end
end
