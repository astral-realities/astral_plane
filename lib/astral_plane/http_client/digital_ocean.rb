class AstralPlane::DigitalOcean < AstralPlane::AbstractHttpClient
  BASE_URL = 'https://api.digitalocean.com/v2/'.freeze

  def self.list_servers
    get("droplets", "")
  end

  def self.get(base_url = BASE_URL, endpoint, token)
    super_array = super
    request = super_array[0]
    http = super_array[1]
    request['content-type'] = "application/json"

    get_response(http, request)
  end
end
