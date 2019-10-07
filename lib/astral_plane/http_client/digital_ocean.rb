class AstralPlane::DigitalOcean < AstralPlane::AbstractHttpClient
  BASE_URL = 'https://api.digitalocean.com/v2/'.freeze
  # TODO: set this token in config
  TOKEN = AstralPlane.digital_ocean_token

  def self.restart_server(droplet_id)
    body = '{"type":"reboot"}'
    post(BASE_URL, "droplets/#{droplet_id}/actions", body, TOKEN)
  end

  def self.create_server(body)
    post(BASE_URL, "droplets", body, TOKEN)
  end

  def self.delete_server(droplet_id)
    delete(BASE_URL, "droplets/#{droplet_id}", TOKEN)
  end

  def self.list_servers
    get(BASE_URL, "droplets", TOKEN)
  end
end
