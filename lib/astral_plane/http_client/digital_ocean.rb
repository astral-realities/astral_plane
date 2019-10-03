class AstralPlane::DigitalOcean < AstralPlane::AbstractHttpClient
  BASE_URL = 'https://api.digitalocean.com/v2/'.freeze

  def self.restart_server(droplet_id)
    body = '{"type":"reboot"}'
    post("droplets/#{droplet_id}/actions", body, "token")
  end

  def self.create_server(body)
    post("droplets", body, "token")
  end

  def self.delete_server(droplet_id)
    delete("droplets/#{droplet_id}", "token")
  end

  def self.list_servers
    get("droplets", "token")
  end

  def self.get(base_url = BASE_URL, endpoint, token)
    super_array = super
    request = super_array[0]
    http = super_array[1]
    request['content-type'] = "application/json"

    get_response(http, request)
  end

  def self.post(base_url = BASE_URL, endpoint, body, token)
    super_array = super
    request = super_array[0]
    http = super_array[1]
    request['content-type'] = "application/json"
    request.body = body

    get_response(http, request)
  end

  def self.delete(base_url = BASE_URL, endpoint, token)
    super_array = super
    request = super_array[0]
    http = super_array[1]
    request['content-type'] = "application/json"

    get_response(http, request)
  end
end
