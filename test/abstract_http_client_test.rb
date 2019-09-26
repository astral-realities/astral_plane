require 'test_helper'

class AstralPlane::AbstractHttpClientTest < Minitest::Test

  def test_restart_server_raises_error
    assert_raises(NotImplementedError){
      AstralPlane::AbstractHttpClient.restart_server
    }
  end

  def test_create_server_raises_error
    assert_raises(NotImplementedError){
      AstralPlane::AbstractHttpClient.create_server
    }
  end

  def test_delete_server_raises_error
    assert_raises(NotImplementedError){
      AstralPlane::AbstractHttpClient.delete_server
    }
  end

  def test_list_servers_raises_error
    assert_raises(NotImplementedError){
      AstralPlane::AbstractHttpClient.list_servers
    }
  end


end
