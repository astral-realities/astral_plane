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
end
