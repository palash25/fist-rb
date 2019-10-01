require "minitest/autorun"

require "fist/client"

# StubTCPServer mimics a TCP server with predefined responses to FIST commands
class StubTCPServer
  def write str
    if str == "VERSION\r\n"
      return 9
    elsif str == "INDEX doc some text\r\n"
      return 21
    elsif str == "SEARCH text\r\n" || str == "DELETE text\r\n"
      return 13
    else
      return 6
    end
  end
end

class FistTest < Minitest::Test
  def setup
    @client = Fist::FistClient.new("localhost", "5575")
    @client.conn = StubTCPServer.new
  end

  def test_version
    assert_equal @client.version, 9
  end

  def test_index
    assert_equal @client.index("doc", "some text"), 21
  end

  def test_search
    assert_equal @client.search("text"), 13
  end

  def test_delete
    assert_equal @client.delete("text"), 13
  end

  def test_close
    assert_equal @client.close, 6
  end
end
