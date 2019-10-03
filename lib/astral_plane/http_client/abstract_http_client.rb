require 'net/https'
require 'uri'

class AstralPlane::AbstractHttpClient

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

  def self.get(base_url, endpoint, token)
    uri = URI.parse(base_url + endpoint)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    request['Authorization'] = "Bearer: #{token}"

    [request, http]
  end

  def self.post(base_url, endpoint, token)
    uri = URI.parse(base_url + endpoint)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request['Authorization'] = "Bearer: #{token}"

    [request, http]
  end

  def self.delete(base_url, endpoint, token)
    uri = URI.parse(base_url + endpoint)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Delete.new(uri.request_uri)
    request['Authorization'] = "Bearer: #{token}"

    [request, http]
  end

  def self.get_response(http, request)
    http.request(request)
  end
end
