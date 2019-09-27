class AstralPlane::Heroku < AstralPlane::AbstractHttpClient
  BASE_URL = 'https://heroku.com/api/v3/'.freeze

  def self.create_server
    :ok
  end


  def self.get(base_url = BASE_URL, endpoint, token)
    super_array = super
    request = super_array[0]
    http = super_array[1]
    request['content-type'] = "application/json"

    get_response(http, request)
  end


end
