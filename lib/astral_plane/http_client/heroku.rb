class AstralPlane::Heroku < AstralPlane::AbstractHttpClient

  # TODO: set this HEROKU_API_KEY in config
  HEROKU_API_KEY = "a45610ff-94b3-48cb-ac16-2e6527559f8c"
  ACCEPT_HEADER = {
        'Accept' => "application/vnd.heroku+json; version=3",
  }

  def self.base_url
    'https://api.heroku.com'.freeze
  end

  # Can be app id or app name
  def self.create_server(app_name, body)
    post("/apps/#{app_name}/dynos", HEROKU_API_KEY, ACCEPT_HEADER, body)
  end

  # heroku uses delete request to restart a dyno
  def self.restart_server(app_name, dyno_name)
    delete("/apps/#{app_name}/dynos/#{dyno_name}", HEROKU_API_KEY, ACCEPT_HEADER, nil)
  end

  #heroku uses post request to delete dyno
  def self.delete_server(app_name, dyno_name)
    post("/apps/#{app_name}/dynos/#{dyno_name}", HEROKU_API_KEY, ACCEPT_HEADER, nil)
  end

  # does not require header: content type json
  def self.list_server(app_name)
    get("/apps/#{app_name}/dynos", HEROKU_API_KEY, ACCEPT_HEADER)
  end


end
