class AstralPlane::DigitalOcean < AstralPlane::AbstractHttpClient
  BASE_URL = 'https://api.digitalocean.com/v2/'.freeze
  TOKEN = AstralPlane.config.digital_ocean_token

  def self.restart_server(droplet_id)
    body = '{"type":"reboot"}'
    post(BASE_URL, "droplets/#{droplet_id}/actions", TOKEN, body)
  end

  def self.create_server(body)
    post(BASE_URL, "droplets", TOKEN, body)
  end

  def self.delete_server(droplet_id)
    delete(BASE_URL, "droplets/#{droplet_id}", TOKEN, nil)
  end

  def self.list_servers
    get(BASE_URL, "droplets", TOKEN, nil)
  end
end
